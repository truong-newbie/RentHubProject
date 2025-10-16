package com.example.renthubproject.controller.client;

import com.example.renthubproject.domain.model.RoomListing;
import com.example.renthubproject.dto.PostDto;
import com.example.renthubproject.domain.model.RentalType;
import com.example.renthubproject.repository.PostRepository;
import com.example.renthubproject.repository.PostSpecification;
import com.example.renthubproject.service.PostService;
import com.example.renthubproject.service.UploadService;
import com.example.renthubproject.service.UserService;
import jakarta.transaction.Transactional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.security.Principal;

import java.math.BigDecimal;
import java.util.List;
import java.util.stream.Collectors;
import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/api/posts")
public class PostRestController {
    private final PostRepository postRepository;
    private final PostService postService;
    private final UploadService uploadService;
    private final UserService userService;

    public PostRestController(PostRepository postRepository, PostService postService, UploadService uploadService, UserService userService) {
        this.postRepository = postRepository;
        this.postService = postService;
        this.uploadService = uploadService;
        this.userService = userService;
    }

    @GetMapping
    public ResponseEntity<?> search(
            @RequestParam(value = "q", required = false) String q,
            @RequestParam(value = "address", required = false) String address,
            @RequestParam(value = "rentalType", required = false) RentalType rentalType,
            @RequestParam(value = "minPrice", required = false) BigDecimal minPrice,
            @RequestParam(value = "maxPrice", required = false) BigDecimal maxPrice,
            @RequestParam(value = "page", defaultValue = "0") int page,
            @RequestParam(value = "size", defaultValue = "10") int size,
            @RequestParam(value = "sort", defaultValue = "createdAt,desc") String sort
    ) {
        String[] sortParts = sort.split(",");
        Sort.Direction dir = Sort.Direction.DESC;
        String sortBy = "createdAt";
        if (sortParts.length >= 1 && sortParts[0].length() > 0) sortBy = sortParts[0];
        if (sortParts.length >= 2) dir = Sort.Direction.fromString(sortParts[1]);
        Pageable pageable = PageRequest.of(page, size, Sort.by(dir, sortBy));

        Specification<RoomListing> spec = PostSpecification.filter(q, address, rentalType, minPrice, maxPrice);
        Page<RoomListing> results = this.postRepository.findAll(spec, pageable);

        Page<PostDto> dtoPage = results.map(this::toDto);
        return ResponseEntity.ok(dtoPage);
    }

    @GetMapping("/{id}")
    @Transactional
    public ResponseEntity<?> detail(@PathVariable Long id, HttpServletRequest request) {
        RoomListing post = this.postService.getPostById(id);
        // increment views in a transactional and thread-safe way
        String ip = request.getHeader("X-Forwarded-For");
        if (ip == null || ip.isEmpty()) {
            ip = request.getRemoteAddr();
        }
        this.postService.incrementViews(post, ip);
        PostDto dto = toDto(post);
        return ResponseEntity.ok(dto);
    }

    /**
     * Create a new post. Requires either authenticated Principal or email param.
     * New posts are assigned status PENDING and user free-post quota is consumed if available.
     */
    @PostMapping
    @Transactional
    public ResponseEntity<?> create(
            @ModelAttribute RoomListing post,
            @RequestParam(value = "images", required = false) List<MultipartFile> images,
            Principal principal,
            @RequestParam(value = "email", required = false) String email
    ) {
        // Resolve user
        com.example.renthubproject.domain.model.User user = null;
        try {
            if (principal != null && principal.getName() != null) {
                user = this.userService.findByEmail(principal.getName());
            } else if (email != null) {
                user = this.userService.findByEmail(email);
            }
        } catch (Exception ex){
            // ignore, guest posting not allowed
        }

        if(user == null) return ResponseEntity.badRequest().body("User must be provided to create post");

        // Check quota
        if(!this.userService.hasFreeQuota(user)){
            return ResponseEntity.status(403).body("No free post quota. Please upgrade your account.");
        }

        // Save images
        if(images != null && !images.isEmpty()){
            List<String> fileNames = images.stream()
                    .filter(img -> !img.isEmpty())
                    .map(img -> this.uploadService.handleSaveUploadFile(img, "roomImages"))
                    .collect(Collectors.toList());
            post.setImages(fileNames);
        }

        post.setStatus(com.example.renthubproject.domain.model.PostStatus.PENDING);
        post.setUser(user);
        this.postService.handleSavePost(post);
        this.userService.consumeFreeQuota(user);
        return ResponseEntity.ok(this.toDto(post));
    }

    @PutMapping("/{id}")
    @Transactional
    public ResponseEntity<?> update(
            @PathVariable Long id,
            @ModelAttribute RoomListing update,
            @RequestParam(value = "images", required = false) List<MultipartFile> images
    ){
        RoomListing existing = this.postService.getPostById(id);
        existing.setTitle(update.getTitle());
        existing.setDescription(update.getDescription());
        existing.setPrice(update.getPrice());
        existing.setRentalType(update.getRentalType());
        existing.setAddress(update.getAddress());

        if(images != null && !images.isEmpty()){
            List<String> fileNames = images.stream()
                    .filter(img -> !img.isEmpty())
                    .map(img -> this.uploadService.handleSaveUploadFile(img, "roomImages"))
                    .collect(Collectors.toList());
            existing.setImages(fileNames);
        }

        // Edited posts go back to pending review
        existing.setStatus(com.example.renthubproject.domain.model.PostStatus.PENDING);
        this.postService.handleSavePost(existing);
        return ResponseEntity.ok(this.toDto(existing));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> delete(@PathVariable Long id){
        this.postService.handleDeletePost(id);
        return ResponseEntity.ok().build();
    }

    private PostDto toDto(RoomListing p) {
        PostDto dto = new PostDto();
        dto.setId(p.getId());
        dto.setTitle(p.getTitle());
        dto.setDescription(p.getDescription());
        dto.setRentalType(p.getRentalType());
        dto.setPrice(p.getPrice());
        dto.setAddress(p.getAddress());
        dto.setImages(p.getImages());
        dto.setViewsCount(p.getViews_count());
        // If you have latitude/longitude fields, map them here. For now default 0.
        dto.setLatitude(p.getLatitude() == null ? 0.0 : p.getLatitude());
        dto.setLongitude(p.getLongitude() == null ? 0.0 : p.getLongitude());
        return dto;
    }
}

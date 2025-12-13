package com.example.renthubproject.controller.admin;
import com.example.renthubproject.domain.model.PostStatus;
import com.example.renthubproject.domain.model.RoomListing;
import com.example.renthubproject.domain.model.User;
import com.example.renthubproject.service.PostService;
import com.example.renthubproject.service.UploadService;
import com.example.renthubproject.service.UserService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class PostController {
    private final PostService postService;
    private final UploadService uploadService;
    private final UserService userService;
    public PostController(PostService postService, UploadService uploadService,
    UserService userService) {
        this.postService = postService;
        this.uploadService = uploadService;
        this.userService = userService;
    }

    @GetMapping("/admin/post")
    public String getPostPage(Model model, @RequestParam("page") Optional<String> pageOptional){
        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                //convert from string to int
                page = Integer.parseInt(pageOptional.get());
            } else {
                //page=1
            }
        } catch (Exception e) {
            //page=1
            //todo1 : handle exceptoin
        }
        Pageable pageable = PageRequest.of(page - 1, 2);
        Page<RoomListing> posts = this.postService.getAllPosts(pageable);
        List<RoomListing> listProducts = posts.getContent();
        model.addAttribute("posts", listProducts);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", posts.getTotalPages());
        return "admin/post/show";
    }

    @GetMapping("/admin/post/create")
    public String getCreatePostPage(Model model){
        model.addAttribute("post", new RoomListing());
        return "admin/post/create";
    }

    @PostMapping("/admin/post/create")
    public String createPostPage(@ModelAttribute("post") RoomListing post,
           @RequestParam("TruongFile") List<MultipartFile> files
            ){
        // Lay user dang dang nhap
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String email=auth.getName();
        User currentUser= this.userService.getUserByEmail(email);

        // Luu user vao post
        post.setUser(currentUser);

        List<String> fileNames= new ArrayList<>();
        for (MultipartFile file : files) {
            if (!file.isEmpty()) {
                String fileName = uploadService.handleSaveUploadFile(file, "roomImages");
                fileNames.add(fileName);
                post.setImages(fileNames);
            }
        }
        this.postService.handleSavePost(post);
        return "redirect:/admin/post";
    }

    @GetMapping("/admin/post/detail/{id}")
    public String showDetail(@PathVariable Long id, Model model) {
        RoomListing post= this.postService.getPostById(id);
        model.addAttribute("post", post);
        return "admin/post/detail";
    }

    @GetMapping("/admin/post/hide/{id}")
    public String confirmHide(@PathVariable Long id, Model model) {
        RoomListing post= this.postService.getPostById(id);
        model.addAttribute("post", post);
        return "admin/post/hide";
    }

    @PostMapping("/admin/post/hide/{id}")
    public String hidePost(@PathVariable Long id) {
        RoomListing post= this.postService.getPostById(id);
        post.setStatus(PostStatus.HIDDEN);
        this.postService.handleSavePost(post);
        return "redirect:/admin/post";
    }

    @GetMapping("/admin/post/delete/{id}")
    public String confirmDelete(@PathVariable Long id, Model model) {
        RoomListing post= this.postService.getPostById(id);
        model.addAttribute("post", post);
        return "admin/post/delete";
    }

    @PostMapping("/admin/post/delete/{id}")
    public String deletePost(@PathVariable Long id) {
        this.postService.handleDeletePost(id);
        return "redirect:/admin/post";
    }
}

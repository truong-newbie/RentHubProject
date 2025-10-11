package com.example.renthubproject.controller.admin;
import com.example.renthubproject.domain.model.PostStatus;
import com.example.renthubproject.domain.model.RoomListing;
import com.example.renthubproject.service.PostService;
import com.example.renthubproject.service.UploadService;
import com.example.renthubproject.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

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
    public String getPostPage(Model model){
        List<RoomListing> posts= this.postService.getAllPosts();
        model.addAttribute("posts", posts);
        return "admin/post/show";
    }

    @GetMapping("/admin/post/create")
    public String getCreatePostPage(Model model){
        model.addAttribute("post", new RoomListing());
        return "admin/post/create";
    }

    @PostMapping("/admin/post/create")
    public String createPostPage(@ModelAttribute("post") RoomListing post,
           @RequestParam("TruongFile") List<MultipartFile> files,
            Principal principal){
        List<String> fileNames= new ArrayList<>();
        for (MultipartFile file : files) {
            if (!file.isEmpty()) {
                String fileName = uploadService.handleSaveUploadFile(file, "roomImages");
                fileNames.add(fileName);
                post.setImages(fileNames);
            }
        }
//        User currentUser = this.userService.findByEmail(principal.getName());
//        post.setUser(currentUser);

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
    public String confirmHide(@PathVariable Long id) {

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
    public String confirmDelete(@PathVariable Long id) {
        return "admin/post/delete";
    }

    @PostMapping("/admin/post/delete/{id}")
    public String deletePost(@PathVariable Long id) {
        this.postService.handleDeletePost(id);
        return "redirect:/admin/post";
    }
}

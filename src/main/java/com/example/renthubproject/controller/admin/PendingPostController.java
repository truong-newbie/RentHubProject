package com.example.renthubproject.controller.admin;
import com.example.renthubproject.domain.model.PostStatus;
import com.example.renthubproject.domain.model.RoomListing;
import com.example.renthubproject.service.PostService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class PendingPostController {

    private final PostService postService;
    public PendingPostController(PostService postService) {
        this.postService = postService;
    }

    @GetMapping("/admin/pendingpost")
    public String getPendingPostPage(Model model){
        List< RoomListing> pendingPosts=this.postService.getAllPendingPost();
        model.addAttribute("pendingPosts",pendingPosts);
        return "admin/pendingpost/show";
    }

    @GetMapping("/admin/pendingpost/detail/{id}")
    public String getDetailPendingPost(@PathVariable long id, Model model){
        RoomListing post= this.postService.getPostById(id);
        model.addAttribute("post",post);
        return "admin/pendingpost/detail";
    }

    @GetMapping("/admin/pendingpost/approve/{id}")
    public String getApprovePendingPost(Model model, @PathVariable long id){
        RoomListing post= this.postService.getPostById(id);
        model.addAttribute("post",post);
        return "admin/pendingpost/approve";
    }

    @PostMapping("/admin/pendingpost/approve/{id}")
    public String approvePendingPost(Model model, @PathVariable long id){
        RoomListing post= this.postService.getPostById(id);
        post.setStatus(PostStatus.APPROVED);
        this.postService.handleSavePost(post);
        return "redirect:/admin/pendingpost";
    }

    @GetMapping("admin/pendingpost/reject/{id}")
    public String getRejectPendingPost(Model model, @PathVariable long id){
        RoomListing post= this.postService.getPostById(id);
        model.addAttribute("post",post);
        return "admin/pendingpost/reject";
    }

    @PostMapping("admin/pendingpost/reject/{id}")
    public String rejectPendingPost(Model model, @PathVariable long id){
        RoomListing post= this.postService.getPostById(id);
        post.setStatus(PostStatus.REJECTED);
        this.postService.handleSavePost(post);
        return "redirect:/admin/pendingpost";
    }

}

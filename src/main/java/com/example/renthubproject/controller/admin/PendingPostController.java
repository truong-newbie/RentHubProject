package com.example.renthubproject.controller.admin;
import com.example.renthubproject.domain.model.PostStatus;
import com.example.renthubproject.domain.model.RoomListing;
import com.example.renthubproject.service.PostService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class PendingPostController {

    private final PostService postService;
    public PendingPostController(PostService postService) {
        this.postService = postService;
    }

    @GetMapping("/admin/pendingpost")
    public String getPendingPostPage(Model model,@RequestParam("page") Optional<String> pageOptional){
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
        Pageable pageable = PageRequest.of(page - 1, 1);
        Page<RoomListing> posts = this.postService.getAllPendingPosts(pageable);
        List<RoomListing> listPosts = posts.getContent();

        model.addAttribute("pendingPosts", listPosts);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", posts.getTotalPages());
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

package com.example.renthubproject.controller.owner;

import com.example.renthubproject.domain.model.PostStatus;
import com.example.renthubproject.domain.model.RoomListing;
import com.example.renthubproject.domain.model.User;
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
public class ItemPostController {
    private final PostService postService;
    private final UploadService uploadService;
    private final UserService userService;
    public ItemPostController(PostService postService , UploadService uploadService, UserService userService) {
        this.postService = postService;
        this.uploadService = uploadService;
        this.userService= userService;
    }

    @GetMapping("/owner/create")
    public String getCreateForm(Model model) {
        model.addAttribute("room", new RoomListing());
        return "owner/post/create";
    }

    @PostMapping("/owner/create")
    public String handleCreateForm(Model model , @ModelAttribute("room") RoomListing room,
                                   @RequestParam("TruongFile") List<MultipartFile> files,
                                   Principal principal) {
        String email= principal.getName();
        List<String> fileNames= new ArrayList<>();
        for (MultipartFile file : files) {
            if (!file.isEmpty()) {
                String fileName = uploadService.handleSaveUploadFile(file, "roomImages");
                fileNames.add(fileName);
                room.setImages(fileNames);
            }
        }
        room.setStatus(PostStatus.PENDING);
        User user= this.userService.getUserByEmail(email);
        room.setUser(user);
        this.postService.handleSavePost(room);
        return "redirect:/owner";
    }

    @GetMapping("/owner/post/detail/{id}")
    public String getDetailPost(Model model, @PathVariable long id){
        RoomListing room= this.postService.getPostById(id);
        model.addAttribute("room", room);
        return "owner/post/detail";
    }

    @GetMapping("/owner/post/update/{id}")
    public String getUpdatePost(Model model, @PathVariable long id){
        RoomListing room = this.postService.getPostById(id);
        model.addAttribute("room",room);
        return "owner/post/update";
    }

    @PostMapping("/owner/post/update/{id}")
    public String handleUpdatePost(Model model, @PathVariable long id, @ModelAttribute("room") RoomListing updateRoom){
        this.postService.handleUpdatePost(id,updateRoom);
        return "redirect:/owner";
    }

    @GetMapping("/owner/post/delete/{id}")
    public String getDeletePost(Model model, @PathVariable long id) {
        RoomListing room= this.postService.getPostById(id);
        model.addAttribute("post", room);
        return "owner/post/delete";
    }

    @PostMapping("/owner/post/delete/{id}")
    public String handleDeletePost(@PathVariable long id){
        this.postService.handleDeletePost(id);
        return "redirect:/owner";
    }

}

package com.example.renthubproject.controller.owner;

import com.example.renthubproject.domain.model.PostStatus;
import com.example.renthubproject.domain.model.RoomListing;
import com.example.renthubproject.domain.model.User;
import com.example.renthubproject.service.PostService;
import com.example.renthubproject.service.UploadService;
import com.example.renthubproject.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
}

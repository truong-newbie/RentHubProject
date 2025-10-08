package com.example.renthubproject.controller.admin;

import com.example.renthubproject.domain.model.User;
import com.example.renthubproject.service.UploadService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class UserController {

    private final UploadService uploadService;
    public UserController(UploadService uploadService) {
        this.uploadService = uploadService;
    }

    @GetMapping("/admin/user")
    public String getUserPage(){
        return "admin/user/show";
    }

    @GetMapping("/admin/user/create")
    public String showCreateUser(Model model){
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping("/admin/user/create")
    public String handleCreateUser(Model model,@ModelAttribute("newUser") User user,
                        @RequestParam("TruongFile") MultipartFile file){
        String avatar= this.uploadService.handleSaveUploadFile(file,"avatar");
        return "admin/user";
    }
}

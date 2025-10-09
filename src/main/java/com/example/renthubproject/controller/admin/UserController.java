package com.example.renthubproject.controller.admin;

import com.example.renthubproject.domain.model.Role;
import com.example.renthubproject.domain.model.User;
import com.example.renthubproject.service.UploadService;
import com.example.renthubproject.service.UserService;
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
    private final UserService userService;

    public UserController(UploadService uploadService, UserService userService) {
        this.uploadService = uploadService;
        this.userService = userService;
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
        user.setAvatar(avatar);
        Role role=userService.getRoleByName(user.getRole().getName());
        user.setRole(role);
        this.userService.handleSaveUser(user);
        return "redirect:/admin/user";
    }
}

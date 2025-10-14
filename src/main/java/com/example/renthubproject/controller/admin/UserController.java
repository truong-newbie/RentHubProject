package com.example.renthubproject.controller.admin;

import com.example.renthubproject.domain.model.Role;
import com.example.renthubproject.domain.model.User;
import com.example.renthubproject.service.UploadService;
import com.example.renthubproject.service.UserService;
import jakarta.validation.Valid;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;


@Controller
public class UserController {

    private final UploadService uploadService;
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UploadService uploadService, UserService userService, PasswordEncoder passwordEncoder) {
        this.uploadService = uploadService;
        this.userService = userService;
        this.passwordEncoder=passwordEncoder;
    }

    @GetMapping("/admin/user")
    public String getUserPage(Model model){
        List<User> users= this.userService.getAllUsers();
        model.addAttribute("users", users);
        return "admin/user/show";
    }

    @GetMapping("/admin/user/create")
    public String showCreateUser(Model model){
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping("/admin/user/create")
    public String handleCreateUser(Model model,@ModelAttribute("newUser") @Valid User user,
                        BindingResult bindingResult,
                        @RequestParam("TruongFile") MultipartFile file){

        //validate
        if(bindingResult.hasErrors()){
            return "admin/user/create";
        }

        String avatar= this.uploadService.handleSaveUploadFile(file,"avatar");
        user.setAvatar(avatar);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        Role role=userService.getRoleByName(user.getRole().getName());
        user.setRole(role);
        this.userService.handleSaveUser(user);
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/detail/{id}")
    public String getDetailUser(@PathVariable Long id, Model model){
        User user=this.userService.getUserById(id);
        model.addAttribute("user", user);
        return "admin/user/detail";
    }

    @GetMapping("/admin/user/update/{id}")
    public String getUpdateUser(Model model, @PathVariable long id){
        User user= this.userService.getUserById(id);
        model.addAttribute("user", user);
        model.addAttribute("updateUser",new User());
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update/{id}")
    public String updateUser(Model model,@PathVariable long id,@ModelAttribute("updateUser") @Valid User updateUser,
    BindingResult bindingResult,
    @RequestParam("TruongFile") MultipartFile file){
        System.out.println(0);
        if (bindingResult.hasErrors()) {
        return "admin/user/update";
        }
        System.out.println(1);
        String avatar= this.uploadService.handleSaveUploadFile(file,"avatar");
        updateUser.setAvatar(avatar);
        this.userService.handleUpdateUser(id,updateUser);
        System.out.println(2);
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUser(Model model, @PathVariable long id){
        User user=this.userService.getUserById(id);
        model.addAttribute("user",user);
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete/{id}")
    public String deleteUser(Model model ,@PathVariable long id){
        this.userService.handleDeleteUser(id);
        return "redirect:/admin/user";
    }


}

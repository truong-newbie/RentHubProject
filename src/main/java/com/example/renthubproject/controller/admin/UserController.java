package com.example.renthubproject.controller.admin;

import com.example.renthubproject.domain.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.ui.Model;


@Controller
public class UserController {
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
    public String handleCreateUser(@ModelAttribute User user){

        return "admin/user";
    }
}

package com.example.renthubproject.controller.admin;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PostController {
    @GetMapping("/admin/post")
    public String getPostPage(){
        return "admin/post/show";
    }
}

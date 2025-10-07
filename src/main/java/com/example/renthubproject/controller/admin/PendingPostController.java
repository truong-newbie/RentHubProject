package com.example.renthubproject.controller.admin;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PendingPostController {
    @GetMapping("/admin/pendingpost")
    public String getPendingPostPage(){
        return "admin/pendingpost/show";
    }
}

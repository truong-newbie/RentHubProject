package com.example.renthubproject.controller.owner;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OwnerHomepageController {

    @GetMapping("/owner")
    public String getDashboard() {
        return "owner/dashboard/show";
    }
}

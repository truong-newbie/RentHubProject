package com.example.renthubproject.controller.owner;

import com.example.renthubproject.domain.model.RoomListing;
import com.example.renthubproject.service.PostService;
import com.example.renthubproject.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class OwnerHomepageController {
    private final PostService postService;
    private final UserService userService;
    public OwnerHomepageController(PostService postService, UserService userService) {
        this.postService = postService;
        this.userService= userService;
    }

    @GetMapping("/owner")
    public String getDashboard(Model model, @AuthenticationPrincipal UserDetails userDetails) {
        String email = userDetails.getUsername();
        Long id = this.userService.findIdByEmail(email);
        List<RoomListing> posts= this.postService.getAllByUserId(id);
        int count= posts.size();
        model.addAttribute("countPosts",count);
        model.addAttribute("posts",posts);
        return "owner/dashboard/show";
    }
}

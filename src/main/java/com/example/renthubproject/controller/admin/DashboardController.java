package com.example.renthubproject.controller.admin;

import com.example.renthubproject.domain.model.RoomListing;
import com.example.renthubproject.domain.model.User;
import com.example.renthubproject.service.PostService;
import com.example.renthubproject.service.UserService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.ui.Model;

import java.util.Collections;
import java.util.List;

@Controller
public class DashboardController {
    private final PostService postService;
    private final UserService userService;
    public DashboardController(PostService postService, UserService userService){
        this.postService=postService;
        this.userService=userService;
    }

    @GetMapping("/admin")
    public String GetDashboard(Model model) {
        List<RoomListing> allPosts= this.postService.getAllPosts();
        List<RoomListing> viewPosts= this.postService.getViewPost();
        List<RoomListing> pendingPosts= this.postService.getAllPendingPost();
        List<User> allUsers= this.userService.getAllUsers();

        //lay ra 5 phan tu moi nhat
        Collections.reverse(allPosts);  //dao nguoc post khong anh huong gi khi truyen vao view
        int size= allPosts.size();
        int fromIndex= Math.max(allPosts.size()-5, 0);
        List<RoomListing> lastFivePosts=  allPosts.subList(fromIndex, size);

        //lay ra % tang giam bai viet moi ngay
        double growthRateAllPost= this.postService.getGrowthRatePosts();
        double growthRateDisplayPost=this.postService.getGrowthRateDisplayPost();
        long growthRateUser = this.userService.getGrowthRateUsers();


        model.addAttribute("allPosts", allPosts);
        model.addAttribute("viewPosts", viewPosts);
        model.addAttribute("pendingPosts", pendingPosts);
        model.addAttribute("users", allUsers);
        model.addAttribute("lastFivePosts", lastFivePosts);
        model.addAttribute("growthRateAllPost", Math.round(growthRateAllPost * 10.0) / 10.0);
        model.addAttribute("growthRateDisplayPost", Math.round(growthRateDisplayPost * 10.0) / 10.0);
        model.addAttribute("growthRateUser",growthRateUser );


        return "admin/dashboard/show";
    }
}

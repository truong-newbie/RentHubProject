package com.example.renthubproject.controller.client;

import com.example.renthubproject.domain.model.RoomListing;
import com.example.renthubproject.service.PostService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HomepageController {
    private final PostService postService;
    public HomepageController(PostService postService) {
        this.postService = postService;
    }

    @GetMapping("/")
    public String getHomepage(Model model){
        List<RoomListing> allPost = this.postService.getAllPosts();
        model.addAttribute("posts", allPost);
        return "client/homepage/show";
    }

    @GetMapping("/rentalroom")
    public String getRentalRoom(Model model){
        List<RoomListing> rentalRooms=  this.postService.getAllPostRentalRoom();
        model.addAttribute("rentalRooms", rentalRooms);
        return "client/homepage/rental_room";
    }

    @GetMapping("/entirehouse")
    public String getEntireHouse(Model model){
        List<RoomListing> entireHouses = this.postService.getAllPostEntireHouse();
        model.addAttribute("entireHouses",entireHouses );
        return "client/homepage/entire_house";
    }

    @GetMapping("/flat")
    public String getFlat(Model model){
        List<RoomListing> flats= this.postService.getAllPostFlat();
        model.addAttribute("flats",flats );
        return "client/homepage/flat";
    }
}

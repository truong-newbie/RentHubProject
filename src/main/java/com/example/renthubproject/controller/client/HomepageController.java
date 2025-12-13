package com.example.renthubproject.controller.client;

import com.example.renthubproject.domain.dto.RegisterDTO;
import com.example.renthubproject.domain.model.RoomListing;
import com.example.renthubproject.domain.model.User;
import com.example.renthubproject.service.PostService;
import com.example.renthubproject.service.UserService;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import java.util.List;

@Controller
public class HomepageController {
    private final PostService postService;
    private final UserService userService;
    public HomepageController(PostService postService , UserService userService) {
        this.postService = postService;
        this.userService = userService;
    }

    @GetMapping("/")
    public String getHomepage(Model model){
        List<RoomListing> allPost = this.postService.getAllPostsInHomepage();
        model.addAttribute("posts", allPost);
        return "client/homepage/show";
    }

    @GetMapping("/rentalroom")
    public String getRentalRoom(Model model){
        List<RoomListing> rentalRooms=  this.postService.getRentalRoomInHomepage();
        model.addAttribute("rentalRooms", rentalRooms);
        return "client/homepage/rental_room";
    }

    @GetMapping("/entirehouse")
    public String getEntireHouse(Model model){
        List<RoomListing> entireHouses = this.postService.getEntireHouseInHomepage();
        model.addAttribute("entireHouses",entireHouses );
        return "client/homepage/entire_house";
    }

    @GetMapping("/flat")
    public String getFlat(Model model){
        List<RoomListing> flats= this.postService.getFlatInHomepage();
        model.addAttribute("flats",flats );
        return "client/homepage/flat";
    }

    @GetMapping("/login")
    public String getLogin(Model model) {
        return "client/auth/login";
    }

    @GetMapping("/register")
    public String getRegister(Model model){
        model.addAttribute("registerUser", new RegisterDTO());
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String handleRegister(@ModelAttribute("registerUser") @Valid RegisterDTO registerDTO,
                                 BindingResult bindingResult) {
        if(bindingResult.hasErrors()){
            return "client/auth/register";
        }
        User user= this.userService.RegisterDTOtoUser(registerDTO);
        this.userService.handleSaveUser(user);
        return "redirect:/login";
    }

    @GetMapping("/access-deny")
    public String denyPage(Model model){
        return "client/auth/deny";
    }

    @GetMapping("/room/{id}")
    public String getRoomDetail(Model model, @PathVariable long id){
        RoomListing room=this.postService.getPostById(id);
        model.addAttribute("room", room);
        return "client/room/detail";
    }
}

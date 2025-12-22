package com.example.renthubproject.controller.client;

import com.example.renthubproject.domain.dto.RegisterDTO;
import com.example.renthubproject.domain.model.*;
import com.example.renthubproject.service.PostService;
import com.example.renthubproject.service.UserService;
import jakarta.validation.Valid;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
public class HomepageController {
    private final PostService postService;
    private final UserService userService;
    public HomepageController(PostService postService , UserService userService) {
        this.postService = postService;
        this.userService = userService;
    }

    @GetMapping("/")
    public String getHomepage(
            @RequestParam(required = false) String keyword,
            @RequestParam(required = false) String priceRange,
            @RequestParam(required = false) String areaRange,
            @RequestParam(defaultValue = "1") int page,
            Model model
    ) {
        Pageable pageable = PageRequest.of(page - 1, 8);

        Page<RoomListing> posts;

        if (keyword != null || priceRange != null || areaRange != null) {
            posts = postService.searchPosts(keyword, priceRange, areaRange, pageable);
        } else {
            posts = postService.getAllPosts(pageable);
        }

        model.addAttribute("posts", posts.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", posts.getTotalPages());

        return "client/homepage/show";
    }


    @GetMapping("/rentalroom")
    public String getRentalRoom(
            @RequestParam(required = false) String keyword,
            @RequestParam(required = false) String priceRange,
            @RequestParam(required = false) String areaRange,

            @RequestParam(required = false, name = "amenity") List<String> amenities,
            @RequestParam(required = false, name = "target") List<String> tenantTypes,

            @RequestParam(defaultValue = "1") int page,
            Model model
    ) {
        Pageable pageable = PageRequest.of(page - 1, 8);

        Page<RoomListing> rentalRooms =
                postService.searchRoom(
                        RentalType.PHONG_TRO,
                        keyword,
                        priceRange,
                        areaRange,
                        amenities,
                        tenantTypes,
                        pageable
                );

        model.addAttribute("rentalRooms", rentalRooms.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", rentalRooms.getTotalPages());

        return "client/homepage/rental_room";
    }


    @GetMapping("/entirehouse")
    public String getEntireHouse(
            @RequestParam(required = false) String keyword,
            @RequestParam(required = false) String priceRange,
            @RequestParam(required = false) String areaRange,

            @RequestParam(required = false, name = "amenity") List<String> amenities,
            @RequestParam(required = false, name = "target") List<String> tenantTypes,

            @RequestParam(defaultValue = "1") int page,
            Model model
    ) {
        Pageable pageable = PageRequest.of(page - 1, 8);

        Page<RoomListing> entireHouses =
                postService.searchRoom(
                        RentalType.NHA_NGUYEN_CAN,
                        keyword,
                        priceRange,
                        areaRange,
                        amenities,
                        tenantTypes,
                        pageable
                );

        model.addAttribute("entireHouses", entireHouses.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", entireHouses.getTotalPages());

        return "client/homepage/entire_house";
    }

    @GetMapping("/flat")
    public String getFlat(
            @RequestParam(required = false) String keyword,
            @RequestParam(required = false) String priceRange,
            @RequestParam(required = false) String areaRange,

            @RequestParam(required = false, name = "amenity") List<String> amenities,
            @RequestParam(required = false, name = "target") List<String> tenantTypes,

            @RequestParam(defaultValue = "1") int page,
            Model model
    ) {
        Pageable pageable = PageRequest.of(page - 1, 8);

        Page<RoomListing> flats =
                postService.searchRoom(
                        RentalType.CAN_HO,
                        keyword,
                        priceRange,
                        areaRange,
                        amenities,
                        tenantTypes,
                        pageable
                );

        model.addAttribute("flats", flats.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", flats.getTotalPages());

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

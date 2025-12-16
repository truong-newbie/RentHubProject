package com.example.renthubproject.controller.client;

import com.example.renthubproject.domain.dto.RegisterDTO;
import com.example.renthubproject.domain.model.RentalType;
import com.example.renthubproject.domain.model.RoomListing;
import com.example.renthubproject.domain.model.User;
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
    public String getHomepage(Model model ,@RequestParam("page") Optional<String> pageOptional){
        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                //convert from string to int
                page = Integer.parseInt(pageOptional.get());
            } else {
                //page=1
            }
        } catch (Exception e) {
            //page=1
            //todo1 : handle exceptoin
        }
        Pageable pageable = PageRequest.of(page - 1, 8);
        Page<RoomListing> posts = postService.getAllPosts(pageable);
        List<RoomListing> listPosts = posts.getContent();
        model.addAttribute("posts", listPosts);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", posts.getTotalPages());
        return "client/homepage/show";
    }

    @GetMapping("/rentalroom")
    public String getRentalRoom(Model model,@RequestParam("page") Optional<String> pageOptional){
        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                //convert from string to int
                page = Integer.parseInt(pageOptional.get());
            } else {
                //page=1
            }
        } catch (Exception e) {
            //page=1
            //todo1 : handle exceptoin
        }
        Pageable pageable = PageRequest.of(page - 1, 8);
        Page<RoomListing> rentalRooms = postService.getAllByRentalType(RentalType.PHONG_TRO,pageable);
        List<RoomListing> listrentalRooms = rentalRooms.getContent();
        model.addAttribute("rentalRooms", listrentalRooms);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", rentalRooms.getTotalPages());
        return "client/homepage/rental_room";
    }

    @GetMapping("/entirehouse")
    public String getEntireHouse(Model model,@RequestParam("page") Optional<String> pageOptional){
        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                //convert from string to int
                page = Integer.parseInt(pageOptional.get());
            } else {
                //page=1
            }
        } catch (Exception e) {
            //page=1
            //todo1 : handle exceptoin
        }
        Pageable pageable = PageRequest.of(page - 1, 8);
        Page<RoomListing> entireHouses = postService.getAllByRentalType(RentalType.NHA_NGUYEN_CAN,pageable);
        List<RoomListing> listentireHouses = entireHouses.getContent();
        model.addAttribute("entireHouses", listentireHouses);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", entireHouses.getTotalPages());
        return "client/homepage/entire_house";
    }

    @GetMapping("/flat")
    public String getFlat(Model model,@RequestParam("page") Optional<String> pageOptional){
        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                //convert from string to int
                page = Integer.parseInt(pageOptional.get());
            } else {
                //page=1
            }
        } catch (Exception e) {
            //page=1
            //todo1 : handle exceptoin
        }
        Pageable pageable = PageRequest.of(page - 1, 8);
        Page<RoomListing> flats = postService.getAllByRentalType(RentalType.CAN_HO ,pageable);
        List<RoomListing> listFlats = flats.getContent();
        model.addAttribute("flats", listFlats);
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

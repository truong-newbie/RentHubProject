package com.example.renthubproject.service;

import com.example.renthubproject.domain.model.PostStatus;
import com.example.renthubproject.domain.model.RentalType;
import com.example.renthubproject.domain.model.RoomListing;
import com.example.renthubproject.domain.model.User;
import com.example.renthubproject.repository.PostRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class PostService {
    private final PostRepository postRepository;
    public PostService(PostRepository postRepository) {
        this.postRepository = postRepository;
    }
    public void handleSavePost(RoomListing post){
        this.postRepository.save(post);
    }

    public List<RoomListing> getAllPosts(){
        return this.postRepository.findAll();
    }

    public RoomListing getPostById(long id){
        return this.postRepository.findById(id)
                .orElseThrow(()-> new RuntimeException("Không tìm thấy roomListing với id = " + id) );
    }

    public void handleDeletePost(long id){
        this.postRepository.deleteById(id);
    }

    public List<RoomListing> getAllPostsInHomepage(){
        List<RoomListing> posts= new ArrayList<>();
        List<RoomListing> allPost=this.postRepository.findAll();
        for(RoomListing room : allPost){
            if(room.getStatus() == PostStatus.APPROVED ){
                posts.add(room);
            }
        }
        return posts;
    }

    public void handleUpdatePost(Long id, RoomListing updateRoom){
        RoomListing existingRoom = this.postRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Post không tồn tại"));
        existingRoom.setTitle(updateRoom.getTitle());
        existingRoom.setAddress(updateRoom.getAddress());
        existingRoom.setDescription(updateRoom.getDescription());
        existingRoom.setPrice(updateRoom.getPrice());
        existingRoom.setRoomNumber(updateRoom.getRoomNumber());
        existingRoom.setArea(updateRoom.getArea());
        existingRoom.setAmenities(updateRoom.getAmenities());
        existingRoom.setNeighborhood(updateRoom.getNeighborhood());
        existingRoom.setTenantType(updateRoom.getTenantType());
        existingRoom.setOwnerName(updateRoom.getOwnerName());
        existingRoom.setPhoneNumber(updateRoom.getPhoneNumber());
        this.postRepository.save(existingRoom);
    }


    public List<RoomListing> getEntireHouseInHomepage(){
        List<RoomListing> posts= new ArrayList<>();
        List<RoomListing> allPost= this.postRepository.findByRentalType(RentalType.NHA_NGUYEN_CAN);
        for(RoomListing room : allPost){
            if(room.getStatus() == PostStatus.APPROVED ){
                posts.add(room);
            }
        }
        return posts;
    }

    public List<RoomListing> getRentalRoomInHomepage(){
        List<RoomListing> posts= new ArrayList<>();
        List<RoomListing> allPost=this.postRepository.findByRentalType(RentalType.PHONG_TRO);
        for(RoomListing room : allPost){
            if(room.getStatus() == PostStatus.APPROVED ){
                posts.add(room);
            }
        }
        return posts;
    }

    public List<RoomListing> getFlatInHomepage(){
        List<RoomListing> posts= new ArrayList<>();
        List<RoomListing> allPost=this.postRepository.findByRentalType(RentalType.CAN_HO);
        for(RoomListing room : allPost){
            if(room.getStatus() == PostStatus.APPROVED ){
                posts.add(room);
            }
        }
        return posts;
    }

    public List<RoomListing> getAllPendingPost(){
        List<RoomListing> pendingPost= new ArrayList<>();
        List<RoomListing> allPost=this.postRepository.findAll();
        for(RoomListing room : allPost){
            if(room.getStatus() == PostStatus.PENDING ){
                pendingPost.add(room);
            }
        }
        return pendingPost;
    }

    public List<RoomListing> getViewPost(){
        List<RoomListing> viewPost= new ArrayList<>();
        List<RoomListing> allPost= this.postRepository.findAll();
        for(RoomListing room: allPost){
            if(room.getStatus() == PostStatus.APPROVED){
                viewPost.add(room);
            }
        }
        return viewPost;
    }

    public List<RoomListing> getAllPostRentalRoom(){
        return this.postRepository.findByRentalType(RentalType.PHONG_TRO);
    }
    public List<RoomListing> getAllPostEntireHouse(){
        return this.postRepository.findByRentalType(RentalType.NHA_NGUYEN_CAN);
    }
    public List<RoomListing> getAllPostFlat(){
        return this.postRepository.findByRentalType(RentalType.CAN_HO);
    }

    public double getGrowthRatePosts(){
        LocalDate today= LocalDate.now();
        LocalDate yesterday= today.minusDays(1);

        LocalDateTime startOfToday = today.atStartOfDay();
        LocalDateTime endOfToday = today.atTime(23, 59, 59);

        LocalDateTime startOfYesterday = yesterday.atStartOfDay();
        LocalDateTime endOfYesterday = yesterday.atTime(23, 59, 59);

        long todayCount= this.postRepository.countByDateTimeRange(startOfToday, endOfToday);
        long yesterdayCount= this.postRepository.countByDateTimeRange(startOfYesterday, endOfYesterday);

        if(yesterdayCount ==0 && todayCount >0){
            return 100.0;
        }
        if(yesterdayCount==0){
            return 0.0;
        }
        return ((double)(todayCount-yesterdayCount)/yesterdayCount)*100;
    }

    public double getGrowthRateDisplayPost(){
        LocalDate today= LocalDate.now();
        LocalDate yesterday= today.minusDays(1);

        LocalDateTime startOfToday = today.atStartOfDay();
        LocalDateTime endOfToday = today.atTime(23, 59, 59);

        LocalDateTime startOfYesterday = yesterday.atStartOfDay();
        LocalDateTime endOfYesterday = yesterday.atTime(23, 59, 59);

        long displayToday = postRepository.countByStatusAndDateTimeRange(PostStatus.APPROVED, startOfToday, endOfToday);
        long displayYesterday = postRepository.countByStatusAndDateTimeRange(PostStatus.APPROVED, startOfYesterday, endOfYesterday);

        if( displayYesterday==0 && displayToday>0){
            return 100.0;
        }
        if(displayToday==0){
            return 0.0;
        }
        return ((double)(displayToday - displayYesterday) / displayYesterday) * 100;
    }

    public List<RoomListing> getAllByUserId(Long id){
        List<RoomListing> rooms = this.postRepository.findAll();
        ArrayList<RoomListing> roomByUserId = new ArrayList<>();

        for(RoomListing room : rooms){
            if(room.getUser() != null && room.getUser().getId()== id ){
                roomByUserId.add(room);
            }
        }
        return roomByUserId;
    }

    public Page<RoomListing> getAllPosts(Pageable pageable){
        return this.postRepository.findAll(pageable);
    }

    public Page<RoomListing> getAllPendingPosts( Pageable pageable){
        return this.postRepository.findByStatus(PostStatus.PENDING, pageable);
    }

    public Page<RoomListing> getAllByRentalType(RentalType rentalType, Pageable pageable){
        return this.postRepository.findByRentalType(rentalType,pageable);
    }

    public Page<RoomListing> searchPosts(
            String keyword,
            String priceRange,
            String areaRange,
            Pageable pageable
    ) {
        Double minPrice = null, maxPrice = null;
        Double minArea = null, maxArea = null;

        // Giá
        if ("1".equals(priceRange)) {
            maxPrice = 2.0;
        } else if ("2".equals(priceRange)) {
            minPrice = 2.0;
            maxPrice = 5.0;
        } else if ("3".equals(priceRange)) {
            minPrice = 5.0;
        }

        // Diện tích
        if ("1".equals(areaRange)) {
            maxArea = 20.0;
        } else if ("2".equals(areaRange)) {
            minArea = 20.0;
            maxArea = 30.0;
        } else if ("3".equals(areaRange)) {
            minArea = 30.0;
        }

        if (keyword != null && keyword.isBlank()) {
            keyword = null;
        }

        return postRepository.search(
                keyword,
                minPrice, maxPrice,
                minArea, maxArea,
                pageable
        );
    }


}

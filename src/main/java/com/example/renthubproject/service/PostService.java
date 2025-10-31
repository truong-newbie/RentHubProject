package com.example.renthubproject.service;

import com.example.renthubproject.domain.model.PostStatus;
import com.example.renthubproject.domain.model.RentalType;
import com.example.renthubproject.domain.model.RoomListing;
import com.example.renthubproject.repository.PostRepository;
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
}

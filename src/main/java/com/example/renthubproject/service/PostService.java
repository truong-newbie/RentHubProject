package com.example.renthubproject.service;

import com.example.renthubproject.domain.model.PostStatus;
import com.example.renthubproject.domain.model.RentalType;
import com.example.renthubproject.domain.model.RoomListing;
import com.example.renthubproject.repository.PostRepository;
import org.springframework.stereotype.Service;
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

    public List<RoomListing> getAllPostRentalRoom(){
        return this.postRepository.findByRentalType(RentalType.PHONG_TRO);
    }
    public List<RoomListing> getAllPostEntireHouse(){
        return this.postRepository.findByRentalType(RentalType.NHA_NGUYEN_CAN);
    }
    public List<RoomListing> getAllPostFlat(){
        return this.postRepository.findByRentalType(RentalType.CAN_HO);
    }
}

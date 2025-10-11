package com.example.renthubproject.service;

import com.example.renthubproject.domain.model.RoomListing;
import com.example.renthubproject.repository.PostRepository;
import org.springframework.stereotype.Service;

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
}

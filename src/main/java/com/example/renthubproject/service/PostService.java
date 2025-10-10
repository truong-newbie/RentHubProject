package com.example.renthubproject.service;

import com.example.renthubproject.domain.model.RoomListing;
import com.example.renthubproject.repository.PostRepository;
import org.springframework.stereotype.Service;

@Service
public class PostService {
    private final PostRepository postRepository;
    public PostService(PostRepository postRepository) {
        this.postRepository = postRepository;
    }
    public void handleSavePost(RoomListing post){
        this.postRepository.save(post);
    }
}

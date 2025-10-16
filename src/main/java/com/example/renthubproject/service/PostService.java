package com.example.renthubproject.service;

import com.example.renthubproject.domain.model.PostStatus;
import com.example.renthubproject.domain.model.RentalType;
import com.example.renthubproject.domain.model.RoomListing;
import com.example.renthubproject.repository.PostRepository;
import com.example.renthubproject.repository.PostViewRepository;
import com.example.renthubproject.domain.model.PostView;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;
import jakarta.transaction.Transactional;

@Service
public class PostService {
    private final PostRepository postRepository;
    private final PostViewRepository postViewRepository;
    public PostService(PostRepository postRepository, PostViewRepository postViewRepository) {
        this.postRepository = postRepository;
        this.postViewRepository = postViewRepository;
    }
    public void handleSavePost(RoomListing post){
        this.postRepository.save(post);
    }

    public Page<RoomListing> search(Specification<RoomListing> spec, Pageable pageable){
        return this.postRepository.findAll(spec, pageable);
    }

    public List<RoomListing> getAllPosts(){
        return this.postRepository.findAll();
    }

    public RoomListing getPostById(long id){
        return this.postRepository.findById(id)
                .orElseThrow(()-> new RuntimeException("Không tìm thấy roomListing với id = " + id) );
    }

    @Transactional
    public void incrementViews(RoomListing post){
        // Reload managed entity if necessary
        RoomListing managed = this.postRepository.findById(post.getId())
                .orElseThrow(() -> new RuntimeException("Không tìm thấy roomListing với id = " + post.getId()));
        managed.setViews_count(managed.getViews_count() + 1);
        this.postRepository.save(managed);
    }

    @Transactional
    public void incrementViews(RoomListing post, String viewerIp){
        RoomListing managed = this.postRepository.findById(post.getId())
                .orElseThrow(() -> new RuntimeException("Không tìm thấy roomListing với id = " + post.getId()));
        managed.setViews_count(managed.getViews_count() + 1);
        this.postRepository.save(managed);

        try{
            PostView pv = new PostView();
            pv.setRoomListing(managed);
            pv.setViewerIp(viewerIp);
            this.postViewRepository.save(pv);
        } catch (Exception ex){
            // swallow logging exceptions so view increment still succeeds
        }
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

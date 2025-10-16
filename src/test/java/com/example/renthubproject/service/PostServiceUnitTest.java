package com.example.renthubproject.service;

import com.example.renthubproject.domain.model.PostView;
import com.example.renthubproject.domain.model.RoomListing;
import com.example.renthubproject.repository.PostRepository;
import com.example.renthubproject.repository.PostViewRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.*;

public class PostServiceUnitTest {
    private PostRepository postRepository;
    private PostViewRepository postViewRepository;
    private PostService postService;

    @BeforeEach
    public void setup(){
        postRepository = mock(PostRepository.class);
        postViewRepository = mock(PostViewRepository.class);
        postService = new PostService(postRepository, postViewRepository);
    }

    @Test
    public void testIncrementViewsCreatesPostViewAndIncrementsCount(){
        RoomListing post = new RoomListing();
        post.setId(1L);
        post.setViews_count(0);

        when(postRepository.findById(1L)).thenReturn(Optional.of(post));
        when(postRepository.save(any(RoomListing.class))).thenAnswer(invocation -> invocation.getArgument(0));
        when(postViewRepository.save(any(PostView.class))).thenAnswer(invocation -> invocation.getArgument(0));

        postService.incrementViews(post, "1.2.3.4");

        ArgumentCaptor<RoomListing> cap = ArgumentCaptor.forClass(RoomListing.class);
        verify(postRepository, times(1)).save(cap.capture());
        assertEquals(1, cap.getValue().getViews_count());

        ArgumentCaptor<PostView> pvCap = ArgumentCaptor.forClass(PostView.class);
        verify(postViewRepository, times(1)).save(pvCap.capture());
        assertEquals("1.2.3.4", pvCap.getValue().getViewerIp());
    }
}

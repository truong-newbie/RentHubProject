package com.example.renthubproject;

import com.example.renthubproject.domain.model.PostStatus;
import com.example.renthubproject.domain.model.RoomListing;
import com.example.renthubproject.repository.PostRepository;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
public class PostApiIntegrationTest {
    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private PostRepository postRepository;

    @Test
    @Transactional
    public void testDetailIncrementsView() throws Exception{
        RoomListing post = new RoomListing();
        post.setTitle("Test post");
        post.setDescription("desc");
        post.setStatus(PostStatus.APPROVED);
        post.setPrice(new BigDecimal("100"));
        post.setAddress("Hanoi");
        post.setViews_count(0);
        post = postRepository.save(post);

        mockMvc.perform(get("/api/posts/" + post.getId())
                .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk());

        RoomListing updated = postRepository.findById(post.getId()).orElseThrow();
        Assertions.assertEquals(1, updated.getViews_count());
    }
}

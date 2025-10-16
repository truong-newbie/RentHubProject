package com.example.renthubproject.repository;

import com.example.renthubproject.domain.model.PostView;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PostViewRepository extends JpaRepository<PostView, Long> {
}

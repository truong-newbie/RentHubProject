package com.example.renthubproject.repository;

import com.example.renthubproject.domain.model.RoomListing;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PostRepository extends JpaRepository<RoomListing,Long> {
}

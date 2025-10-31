package com.example.renthubproject.repository;

import com.example.renthubproject.domain.model.PostStatus;
import com.example.renthubproject.domain.model.RentalType;
import com.example.renthubproject.domain.model.RoomListing;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface PostRepository extends JpaRepository<RoomListing,Long> {
    List<RoomListing> findByRentalType(RentalType rentalType);

    @Query("""
       SELECT COUNT(p)
       FROM RoomListing p
       WHERE  p.createdAt BETWEEN :startOfDay AND :endOfDay
       """)
    long countByDateTimeRange(
            @Param("startOfDay") LocalDateTime startOfDay,
            @Param("endOfDay") LocalDateTime endOfDay
    );


    @Query("""
       SELECT COUNT(p)
       FROM RoomListing p
       WHERE p.status = :status
         AND p.createdAt BETWEEN :startOfDay AND :endOfDay
       """)
    long countByStatusAndDateTimeRange(
            @Param("status") PostStatus status,
            @Param("startOfDay") LocalDateTime startOfDay,
            @Param("endOfDay") LocalDateTime endOfDay
    );

}

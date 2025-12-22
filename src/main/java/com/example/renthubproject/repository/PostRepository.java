package com.example.renthubproject.repository;

import com.example.renthubproject.domain.model.PostStatus;
import com.example.renthubproject.domain.model.RentalType;
import com.example.renthubproject.domain.model.RoomListing;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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

    Page<RoomListing> findByStatus(PostStatus status, Pageable pageable);
    Page<RoomListing> findByRentalType(RentalType rentalType, Pageable pageable);

    @Query("""
SELECT r FROM RoomListing r
WHERE
(:keyword IS NULL OR LOWER(r.title) LIKE LOWER(CONCAT('%', :keyword, '%')))
AND (:minPrice IS NULL OR r.price >= :minPrice)
AND (:maxPrice IS NULL OR r.price <= :maxPrice)
AND (:minArea IS NULL OR r.area >= :minArea)
AND (:maxArea IS NULL OR r.area <= :maxArea)
""")
    Page<RoomListing> search(
            @Param("keyword") String keyword,
            @Param("minPrice") Double minPrice,
            @Param("maxPrice") Double maxPrice,
            @Param("minArea") Double minArea,
            @Param("maxArea") Double maxArea,
            Pageable pageable
    );

    @Query("""
SELECT DISTINCT r FROM RoomListing r
WHERE r.rentalType = :type
AND (:keyword IS NULL OR r.title LIKE %:keyword% OR r.address LIKE %:keyword%)
AND (:minPrice IS NULL OR r.price >= :minPrice)
AND (:maxPrice IS NULL OR r.price <= :maxPrice)
AND (:minArea IS NULL OR r.area >= :minArea)
AND (:maxArea IS NULL OR r.area <= :maxArea)
AND (:amenities IS NULL OR EXISTS (
    SELECT a FROM r.amenities a WHERE a IN :amenities
))
AND (:tenantTypes IS NULL OR EXISTS (
    SELECT t FROM r.tenantTypes t WHERE t IN :tenantTypes
))
""")
    Page<RoomListing> searchAdvanced(
            @Param("type") RentalType type,
            @Param("keyword") String keyword,
            @Param("minPrice") Double minPrice,
            @Param("maxPrice") Double maxPrice,
            @Param("minArea") Double minArea,
            @Param("maxArea") Double maxArea,
            @Param("amenities") List<String> amenities,
            @Param("tenantTypes") List<String> tenantTypes,
            Pageable pageable
    );




}

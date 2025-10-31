package com.example.renthubproject.repository;

import com.example.renthubproject.domain.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findById(long id);
    void deleteById(long id);

    List<User> id(long id);

    User findByEmail(String email);

    boolean existsByEmail(String email);

    @Query("""
       SELECT COUNT(p)
       FROM User p
       WHERE  p.createdAt BETWEEN :startOfDay AND :endOfDay
       """)
    long countByDateTimeRange(
            @Param("startOfDay") LocalDateTime startOfDay,
            @Param("endOfDay") LocalDateTime endOfDay
    );

}

package com.example.renthubproject.repository;

import com.example.renthubproject.domain.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface RoleRepository extends JpaRepository<Role, Long> {
    Role findByName(String name);
    void deleteById(Long id);
    Role findById(long id);
}

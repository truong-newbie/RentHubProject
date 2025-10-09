package com.example.renthubproject.service;

import com.example.renthubproject.domain.model.Role;
import com.example.renthubproject.domain.model.User;
import com.example.renthubproject.repository.RoleRepository;
import com.example.renthubproject.repository.UserRepository;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    public UserService(UserRepository userRepository,RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    public void handleSaveUser(User user){
        this.userRepository.save(user);
    }

    public Role getRoleByName(String name){
        return this.roleRepository.findByName(name);
    }
}

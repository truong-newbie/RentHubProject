package com.example.renthubproject.service;

import com.example.renthubproject.domain.model.Role;
import com.example.renthubproject.domain.model.User;
import com.example.renthubproject.repository.RoleRepository;
import com.example.renthubproject.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.util.List;

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

    public List<User> getAllUsers(){
        return this.userRepository.findAll();
    }

    public User getUserById(long id) {
        return this.userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Không tìm thấy user với id = " + id));
    }

    public void handleUpdateUser(long id, User updateUser){
        User existingUser = this.userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Không tìm thấy user với id = " + id));
        existingUser.setFullName(updateUser.getFullName());
        existingUser.setEmail(updateUser.getEmail());
        existingUser.setPhoneNumber(updateUser.getPhoneNumber());
        existingUser.setAddress(updateUser.getAddress());
        Role role= getRoleByName(updateUser.getRole().getName());
        existingUser.setRole(role);
        this.userRepository.save(existingUser);
    }

    public void handleDeleteUser(long id){
        this.userRepository.deleteById(id);
    }

}

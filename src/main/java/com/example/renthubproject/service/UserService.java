package com.example.renthubproject.service;

import com.example.renthubproject.domain.dto.RegisterDTO;
import com.example.renthubproject.domain.model.Role;
import com.example.renthubproject.domain.model.User;
import com.example.renthubproject.repository.RoleRepository;
import com.example.renthubproject.repository.UserRepository;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final PasswordEncoder passwordEncoder;
    public UserService(UserRepository userRepository,RoleRepository roleRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.passwordEncoder = passwordEncoder;
    }

    public void handleSaveUser(User user){
        this.userRepository.save(user);
    }

    public Role getRoleByName(String name){
        return this.roleRepository.findByName(name);
    }

    public Role getRoleById(Long id){
        return this.roleRepository.findById(id).orElseThrow( ()->
                new RuntimeException("User not found with role:" )
                );
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
        Optional<Role> role = this.roleRepository.findById((updateUser.getRole().getId()));
        if(role.isEmpty()){
            throw new RuntimeException("Không tìm thấy role cần tìm");
        }
        existingUser.setRole(role.get());
        this.userRepository.save(existingUser);
    }

    public void handleDeleteUser(long id){
        this.userRepository.deleteById(id);
    }

    public User RegisterDTOtoUser(RegisterDTO registerDTO) {
        User user=new User();
        Optional<Role> role= this.roleRepository.findById(registerDTO.getRole_id());
        if(role.isEmpty()){
            throw new IllegalArgumentException("Không tìm thấy vai trò với ID: " + registerDTO.getRole_id());
        }
        user.setFullName(registerDTO.getFullName());
        user.setEmail(registerDTO.getEmail());
        user.setPassword(passwordEncoder.encode(registerDTO.getPassword()));
        user.setRole(role.get());
        return user;
    }

    public boolean checkEmailExist(String email){
        return this.userRepository.existsByEmail(email);
    }

    public User getUserByEmail(String email){
        return this.userRepository.findByEmail(email);
    }

}

package com.example.renthubproject.service;

import com.example.renthubproject.domain.model.User;
import com.example.renthubproject.repository.RoleRepository;
import com.example.renthubproject.repository.UserRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.*;

public class UserServiceUnitTest {
    private UserRepository userRepository;
    private RoleRepository roleRepository;
    private UserService userService;

    @BeforeEach
    public void setup(){
        userRepository = mock(UserRepository.class);
        roleRepository = mock(RoleRepository.class);
        userService = new UserService(userRepository, roleRepository);
    }

    @Test
    public void testConsumeFreeQuota(){
        User u = new User();
        u.setId(1L);
        u.setFreePostQuota(2);

        when(userRepository.findById(1L)).thenReturn(Optional.of(u));
        doAnswer(invocation -> { return invocation.getArgument(0); }).when(userRepository).save(any(User.class));

        userService.consumeFreeQuota(u);
        assertEquals(1, u.getFreePostQuota());
    }
}

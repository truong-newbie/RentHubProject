package com.example.renthubproject.domain.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.Random;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Otp {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String otp_code;
    private LocalDateTime expired_at;
    private boolean is_used;

    @ManyToOne
    @JoinColumn(name="user_id")
    private User user;

    public static String generateOtp(){
        Random random= new Random();
        int otp = 100000+ random.nextInt(900000);
        return String.valueOf(otp);
    }
}

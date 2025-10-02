package com.example.renthubproject.domain.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

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
}

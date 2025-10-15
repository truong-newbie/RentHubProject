package com.example.renthubproject.domain.model;

import com.example.renthubproject.service.validate.StrongPassword;
import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;
import java.time.LocalDateTime;
import java.util.List;


@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name="users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotBlank(message = "This field cannot be blank.")
    @Size(min=3, message = "Tên phải có tối thiểu 3 ký tự")
    private String fullName;

    @NotBlank(message = "This field cannot be blank.")
    @Email(message = "Email không hợp lệ", regexp = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$")
    private String email;

//    @StrongPassword
    private String password;

    private String phoneNumber;

    private String address;
    private String avatar;

    @CreationTimestamp
    private LocalDateTime createdAt;

    @OneToMany(mappedBy = "user")
    private List<Otp> otpList;

    @OneToMany(mappedBy = "user")
    private List<RoomListing> roomListings;

    @OneToMany(mappedBy = "user")
    private List<Bookmark> bookmarks;

    @OneToMany(mappedBy = "user")
    private List<Notification> notifications;

    @ManyToOne()
    @JoinColumn(name="role_id")
    private Role role;
}

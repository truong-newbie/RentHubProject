package com.example.renthubproject.domain.dto;


import com.example.renthubproject.service.validate.RegisterChecked;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@RegisterChecked
public class RegisterDTO {
    @Size(min=3, message = "fullName phải có tối thiểu 3 kí tự")
    private String fullName;

    @Email(message = "Email không hợp lệ", regexp = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$")
    private String email;
    private String phoneNumber;
    private String password;
    private Long role_id;

    @Size(min=3, message=" Password phải có tối thiểu 3 ký tự")
    private String confirmPassword;
}

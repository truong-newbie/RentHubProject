package com.example.renthubproject.controller;

import com.example.renthubproject.domain.model.Otp;
import com.example.renthubproject.service.EmailService;
import com.example.renthubproject.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

@Controller
@RequestMapping("/forgot-password")
public class ForgotPasswordController {

    private final EmailService emailService;
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;

    public ForgotPasswordController(EmailService emailService, UserService userService, PasswordEncoder passwordEncoder) {
        this.emailService = emailService;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping
    public String showForgotPasswordForm() {
        return "client/auth/forgot-password";
    }
    @PostMapping
    public String processForgotPassword(@RequestParam("email") String email, Model model, HttpSession session) {
        // kiểm tra email có trong hệ thống không
        if (!userService.checkEmailExist(email)) {
            model.addAttribute("error", "Email không tồn tại trong hệ thống!");
            return "client/auth/forgot-password";
        }
        // tạo mã OTP
        String otp = Otp.generateOtp();
        session.setAttribute("otp", otp);
        session.setAttribute("email", email);
        session.setMaxInactiveInterval(300); // OTP có hiệu lực 5 phút
        try {
            emailService.sendOtpEmail(email, otp);
        } catch (IOException e) {
            model.addAttribute("error", "Không thể gửi OTP, vui lòng thử lại!");
            return "client/auth/forgot-password";
        }
        return "redirect:/forgot-password/verify-otp";
    }

    @GetMapping("/verify-otp")
    public String showVerifyOtpForm() {
        return "client/auth/verify-otp";
    }

    @PostMapping("/verify-otp")
    public String verifyOtp(@RequestParam("otp") String userOtp, HttpSession session, Model model) {
        String sessionOtp = (String) session.getAttribute("otp");

        if (sessionOtp == null) {
            model.addAttribute("error", "OTP đã hết hạn, vui lòng yêu cầu lại!");
            return "client/auth/verify-otp";
        }

        if (!sessionOtp.equals(userOtp)) {
            model.addAttribute("error", "Mã OTP không đúng!");
            return "client/auth/verify-otp";
        }

        return "redirect:/forgot-password/reset";
    }

    @GetMapping("/reset")
    public String showResetPasswordForm() {
        return "client/auth/reset-password";
    }

    @PostMapping("/reset")
    public String resetPassword(@RequestParam("newPassword") String newPassword,
                                @RequestParam("confirmPassword") String confirmPassword,
                                HttpSession session, Model model) {

        String email = (String) session.getAttribute("email");
        if (email == null) {
            return "redirect:/forgot-password";
        }  // tức là khi này người dùng  có thể truy cập dù chưa vào trang forgotpassword và verify
        // --> nên sẽ redirect về forgot-password

        if(!newPassword.equals(confirmPassword)) {
            model.addAttribute("error", "Passwords do not match!");
            return "client/auth/reset-password";
        }

        try {
            String password=this.passwordEncoder.encode(newPassword);
            userService.updatePassword(email, password);
        } catch (Exception e) {
            model.addAttribute("error", "Lỗi khi đặt lại mật khẩu!");
            return "client/auth/reset-password";
        }

        session.invalidate(); // xóa session chứa OTP/email
        return "redirect:/login?resetSuccess=true";
    }
}

package com.example.renthubproject.service.validate;


import com.example.renthubproject.repository.UserRepository;
import com.example.renthubproject.service.UserService;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

@Service
public class UniqueEmailValidator implements ConstraintValidator<UniqueEmail, String> {

    @Autowired
    private UserService userService;

    public UniqueEmailValidator() {
        // constructor mặc định để Hibernate Validator có thể khởi tạo
    }

    @Override
    public void initialize(UniqueEmail constraintAnnotation) {
        // Cho phép Spring inject dependencies vào class này
        SpringBeanAutowiringSupport.processInjectionBasedOnCurrentContext(this);
    }

    @Override
    public boolean isValid(String email, ConstraintValidatorContext context) {
        if (email == null || email.isBlank()) {
            return true;
        }
        return !userService.checkEmailExist(email);
    }
}

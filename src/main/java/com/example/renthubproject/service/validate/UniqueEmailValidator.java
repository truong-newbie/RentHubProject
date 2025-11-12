package com.example.renthubproject.service.validate;

import com.example.renthubproject.service.UserService;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

@Component
public class UniqueEmailValidator implements ConstraintValidator<UniqueEmail, String> {

//    public UniqueEmailValidator() {
//        // constructor mặc định để Hibernate Validator có thể khởi tạo
//    }
//    private final UserService userService;
//    public UniqueEmailValidator(UserService userService){
//        this.userService = userService;
//    }
@Autowired
private UserService userService;

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

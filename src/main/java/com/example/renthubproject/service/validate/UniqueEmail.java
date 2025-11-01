package com.example.renthubproject.service.validate;

import jakarta.validation.Constraint;
import jakarta.validation.Payload;
import java.lang.annotation.*;

@Documented
@Constraint(validatedBy = UniqueEmailValidator.class)
@Target({ ElementType.FIELD })
@Retention(RetentionPolicy.RUNTIME)
public @interface UniqueEmail {
    String message() default "Email này đã được sử dụng!";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}

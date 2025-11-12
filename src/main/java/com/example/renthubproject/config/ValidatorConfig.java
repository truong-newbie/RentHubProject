package com.example.renthubproject.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.validation.beanvalidation.SpringConstraintValidatorFactory;

@Configuration
public class ValidatorConfig {
    @Autowired
    private ApplicationContext applicationContext;

    @Bean
    public LocalValidatorFactoryBean validator() {
        LocalValidatorFactoryBean bean = new LocalValidatorFactoryBean();
        bean.setConstraintValidatorFactory(
                new SpringConstraintValidatorFactory(applicationContext.getAutowireCapableBeanFactory())
        );
        return bean;
    }
}

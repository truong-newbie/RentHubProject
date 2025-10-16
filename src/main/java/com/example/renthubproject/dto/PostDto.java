package com.example.renthubproject.dto;

import com.example.renthubproject.domain.model.RentalType;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PostDto {
    private long id;
    private String title;
    private String description;
    private RentalType rentalType;
    private BigDecimal price;
    private String address;
    private List<String> images;
    private long viewsCount;
    private double latitude; // optional, if available
    private double longitude; // optional, if available
}

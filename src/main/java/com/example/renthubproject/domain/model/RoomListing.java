package com.example.renthubproject.domain.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;


@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class RoomListing {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String title;
    private String description;

    @Enumerated(EnumType.STRING)
    private PostStatus status;

    @Enumerated(EnumType.STRING)
    private RentalType rentalType;

    private BigDecimal price;
    private String address;

    @Column(name = "view_count")
    private Long viewCount = 0L;

    private Double area;            //dien tich

    @ElementCollection // Đánh dấu đây là một Collection của các kiểu cơ bản
    @CollectionTable(name = "room_amenities", joinColumns = @JoinColumn(name = "room_id")) // Tạo bảng riêng
    @Column(name = "amenity_name") // Tên cột trong bảng mới chứa các chuỗi
    @Enumerated(EnumType.STRING)
    private List<Amenity> amenities; // tien nghi

    @ElementCollection
    @CollectionTable(name = "room_neighborhood", joinColumns = @JoinColumn(name = "room_id"))
    @Column(name = "neighborhood_name")
    @Enumerated(EnumType.STRING)
    private List<Neighborhood> neighborhood;  // moi truong xung quanh

    @ElementCollection
    @CollectionTable(name = "room_tenantType", joinColumns = @JoinColumn(name = "room_id"))
    @Column(name = "tenantType_name")
    @Enumerated(EnumType.STRING)
    private List<TenantType> tenantTypes;  //doi tuong thue

    private String phoneNumber;
    private long roomNumber;
    private String ownerName;

    @CreationTimestamp
    private LocalDateTime createdAt;

    @UpdateTimestamp
    private LocalDateTime updatedAt;

    @ElementCollection
    @CollectionTable(name = "room_images", joinColumns = @JoinColumn(name = "room_id"))
    @Column(name = "image_path")
    private List<String> images;

    @ManyToOne
    @JoinColumn(name="user_id")
    private User user;

    @OneToMany(mappedBy = "roomListing")
    private List<Bookmark> bookmarks;

    @OneToMany(mappedBy = "roomListing")
    private List<Review> reviews;

    public String getCreatedAtFormatted() {
        return createdAt.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
    }

}

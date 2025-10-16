package com.example.renthubproject.repository;

import com.example.renthubproject.domain.model.RoomListing;
import com.example.renthubproject.domain.model.RentalType;
import jakarta.persistence.criteria.Predicate;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.util.StringUtils;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class PostSpecification {
    public static Specification<RoomListing> filter(
            String keyword,
            String address,
            RentalType rentalType,
            BigDecimal minPrice,
            BigDecimal maxPrice
    ) {
        return (root, query, cb) -> {
            List<Predicate> predicates = new ArrayList<>();

            if (StringUtils.hasText(keyword)) {
                String like = "%" + keyword.toLowerCase() + "%";
                predicates.add(cb.or(
                        cb.like(cb.lower(root.get("title")), like),
                        cb.like(cb.lower(root.get("description")), like)
                ));
            }

            if (StringUtils.hasText(address)) {
                String like = "%" + address.toLowerCase() + "%";
                predicates.add(cb.like(cb.lower(root.get("address")), like));
            }

            if (rentalType != null) {
                predicates.add(cb.equal(root.get("rentalType"), rentalType));
            }

            if (minPrice != null) {
                predicates.add(cb.greaterThanOrEqualTo(root.get("price"), minPrice));
            }

            if (maxPrice != null) {
                predicates.add(cb.lessThanOrEqualTo(root.get("price"), maxPrice));
            }

            // Only return approved posts by default
            predicates.add(cb.equal(root.get("status"), com.example.renthubproject.domain.model.PostStatus.APPROVED));

            return cb.and(predicates.toArray(new Predicate[0]));
        };
    }
}

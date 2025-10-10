package com.example.renthubproject.domain.model;

public enum PostStatus {
    PENDING("Chờ duyệt"),
    APPROVED("Đã duyệt"),
    REJECTED("Bị từ chối"),
    HIDDEN("Đã ẩn"),
    DELETED("Đã xóa");

    private final String description;

    PostStatus(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }
}

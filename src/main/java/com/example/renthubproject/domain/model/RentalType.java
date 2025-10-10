package com.example.renthubproject.domain.model;

public enum RentalType {
    PHONG_TRO("Phòng trọ"),
    NHA_NGUYEN_CAN("Nhà nguyên căn"),
    CAN_HO("Căn hộ");

    private final String displayName;

    RentalType(String displayName) {
        this.displayName = displayName;
    }

    public String getDisplayName() {
        return displayName;
    }
}

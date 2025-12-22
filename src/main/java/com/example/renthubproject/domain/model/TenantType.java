package com.example.renthubproject.domain.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
public enum TenantType {
    HOC_SINH("Học sinh"),
    DI_LAM("Đi làm"),
    GIA_DINH("Gia đình"),
    CAP_DOI("Cặp đôi");

    private final String label;

    TenantType(String label) {
        this.label = label;
    }

    public String getLabel() {
        return label;
    }
}

package com.example.renthubproject.domain.model;

public enum Neighborhood {

    MARKET("Chợ"),
    SUPERMARKET("Siêu thị"),
    HOSPITAL("Bệnh viện"),
    SCHOOL("Trường học"),
    PARK("Công viên"),
    BUS_STOP("Bến xe Bus"),
    SPORT_CENTER("Trung tâm thể dục thể thao");

    private final String label;

    Neighborhood(String label) {
        this.label = label;
    }

    public String getLabel() {
        return label;
    }
}

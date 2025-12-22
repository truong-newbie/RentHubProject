package com.example.renthubproject.domain.model;


public enum Amenity {

    MEZZANINE("Gác lửng"),
    WIFI("Wifi"),
    PRIVATE_WC("Vệ sinh trong"),
    BATHROOM("Phòng tắm"),
    WATER_HEATER("Bình nóng lạnh"),
    KITCHEN_SHELF("Kệ bếp"),
    WASHING_MACHINE("Máy giặt"),
    TV("Tivi"),
    AC("Điều hòa"),
    FRIDGE("Tủ lạnh"),
    BED("Giường nệm"),
    WARDROBE("Tủ áo quần");

    private final String label;

    Amenity(String label) {
        this.label = label;
    }

    public String getLabel() {
        return label;
    }
}

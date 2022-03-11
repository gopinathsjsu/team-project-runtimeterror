package com.example.hmservice.hotel;

public class SwimmingPoolAccess extends AmenityDecorator {
    Hotel hotel;

    public SwimmingPoolAccess(Hotel h) {
        this.hotel = h;
    }

    @Override
    public Double getCost() {
        Double costMultiplier = 1.02;
        return this.hotel.getCost() * costMultiplier;
    }

    @Override
    public String getPriceBreakdown() {
        return null;
    }
}

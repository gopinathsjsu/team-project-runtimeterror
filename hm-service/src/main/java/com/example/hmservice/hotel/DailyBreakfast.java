package com.example.hmservice.hotel;

public class DailyBreakfast extends AmenityDecorator {
    Hotel hotel;

    DailyBreakfast(Hotel h) {
        this.hotel = h;
    }

    @Override
    public String getPriceBreakdown() {
        return null;
    }

    @Override
    public Double getCost() {
        Double costMultiplier = 1.02;
        return this.hotel.getCost() * costMultiplier;
    }
}

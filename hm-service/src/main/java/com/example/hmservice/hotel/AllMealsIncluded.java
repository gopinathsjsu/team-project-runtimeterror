package com.example.hmservice.hotel;

public class AllMealsIncluded extends AmenityDecorator {
    Hotel hotel;

    public AllMealsIncluded(Hotel h) {
        this.hotel = h;
    }

    @Override
    public Double getCost() {
        Double costMultiplier = 1.08;
        return this.hotel.getCost() * costMultiplier;
    }

    @Override
    public String getPriceBreakdown() {
        return null;
    }
}

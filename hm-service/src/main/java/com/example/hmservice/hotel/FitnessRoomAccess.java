package com.example.hmservice.hotel;

public class FitnessRoomAccess extends AmenityDecorator {
    Hotel hotel;

    public FitnessRoomAccess(Hotel h) {
        this.hotel = h;
    }

    @Override
    public String getPriceBreakdown() {
        return null;
    }

    @Override
    public Double getCost() {
        Double costMultiplier = 1.04;
        return this.hotel.getCost() * costMultiplier;
    }
}

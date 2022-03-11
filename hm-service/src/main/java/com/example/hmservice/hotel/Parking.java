package com.example.hmservice.hotel;

public class Parking extends AmenityDecorator {
    Hotel hotel;

    public Parking(Hotel h) {
        this.hotel = h;
    }

    @Override
    public String getPriceBreakdown() {
        return this.hotel.getPriceBreakdown() + "\n All Day Parking";
    }

    @Override
    public Double getCost() {
        Double costMultiplier = 1.05;
        return this.hotel.getCost() * costMultiplier;
    }


}

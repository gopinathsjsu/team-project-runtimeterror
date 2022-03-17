package com.example.hmservice.hotel;

public class FitnessRoomAccess extends AmenityDecorator {
    Hotel hotel;
    private final Double fitnessRoomAccessCost = 4.99;

    public FitnessRoomAccess(Hotel h) {
        this.hotel = h;
    }

    @Override
    public String getPriceBreakdown() {
        return this.hotel.getPriceBreakdown()
                + "\n Fitness Room Access: " + fitnessRoomAccessCost;
    }

    @Override
    public Double getCost() {

        return this.hotel.getCost() + fitnessRoomAccessCost;
    }
}

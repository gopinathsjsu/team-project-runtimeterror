package com.example.hmservice.hotel;

public class Parking extends AmenityDecorator {
    Hotel hotel;
    private final Double parkingAccessCost = 2.99;

    public Parking(Hotel h) {
        this.hotel = h;
    }

    @Override
    public String getPriceBreakdown() {
        return this.hotel.getPriceBreakdown()
                + "\n All Day Parking: " + parkingAccessCost;
    }

    @Override
    public Double getCost() {

        return this.hotel.getCost() + parkingAccessCost;
    }


}

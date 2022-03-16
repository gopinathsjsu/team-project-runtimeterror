package com.example.hmservice.hotel;

public class SwimmingPoolAccess extends AmenityDecorator {
    Hotel hotel;
    private final Double swimmingPoolAccessCost = 1.99;

    public SwimmingPoolAccess(Hotel h) {
        this.hotel = h;
    }

    @Override
    public Double getCost() {

        return this.hotel.getCost() + swimmingPoolAccessCost;
    }

    @Override
    public String getPriceBreakdown() {
        return this.hotel.getPriceBreakdown() +
                "\n Swimming Pool Access: " + swimmingPoolAccessCost;
    }
}

package com.hmservice.hotel;

public class DailyBreakfast extends AmenityDecorator {
    Hotel hotel;
    private final Double breakfastCost = 3.99;

    public DailyBreakfast(Hotel h) {
        this.hotel = h;
    }

    @Override
    public String getPriceBreakdown() {
        return this.hotel.getPriceBreakdown() +
                "<br /> Daily Continental Breakfast: " + breakfastCost;
    }

    @Override
    public Double getCost() {

        return this.hotel.getCost() + breakfastCost;
    }
}

package com.hmservice.hotel;

public class AllMealsIncluded extends AmenityDecorator {
    Hotel hotel;
    private final Double allMealsCost = 5.99;
    public AllMealsIncluded(Hotel h) {
        this.hotel = h;
    }

    @Override
    public Double getCost() {

        return this.hotel.getCost() + allMealsCost;
    }

    @Override
    public String getPriceBreakdown() {
        return this.hotel.getPriceBreakdown()
                + "\n All Meals Included: " + allMealsCost;
    }
}

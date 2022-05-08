package com.hmservice.hotel;

import com.hmservice.hotel.helper.CurrencyConverter;

public class DailyBreakfast extends AmenityDecorator {
    Hotel hotel;
    private final Double breakfastCost = 3.99;

    public DailyBreakfast(Hotel h) {
        this.hotel = h;
    }

    @Override
    public String getPriceBreakdown() {
        return this.hotel.getPriceBreakdown() +
                "<br /> Daily Continental Breakfast: " + CurrencyConverter.formatCurrency( breakfastCost);
    }

    @Override
    public Double getCost() {

        return this.hotel.getCost() + breakfastCost;
    }
}

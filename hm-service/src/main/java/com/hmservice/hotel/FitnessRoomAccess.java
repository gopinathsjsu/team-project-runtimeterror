package com.hmservice.hotel;

import com.hmservice.hotel.helper.CurrencyConverter;

public class FitnessRoomAccess extends AmenityDecorator {
    Hotel hotel;
    private final Double fitnessRoomAccessCost = 4.99;

    public FitnessRoomAccess(Hotel h) {
        this.hotel = h;
    }

    @Override
    public String getPriceBreakdown() {
        return this.hotel.getPriceBreakdown()
                + "<br /> Fitness Room Access: " + CurrencyConverter.formatCurrency(fitnessRoomAccessCost);
    }

    @Override
    public Double getCost() {

        return this.hotel.getCost() + fitnessRoomAccessCost;
    }
}

package com.hmservice.hotel;

import com.hmservice.hotel.helper.CurrencyConverter;

public class Parking extends AmenityDecorator {
    Hotel hotel;
    private final Double parkingAccessCost = 2.99;

    public Parking(Hotel h) {
        this.hotel = h;
    }

    @Override
    public String getPriceBreakdown() {
        return this.hotel.getPriceBreakdown()
                + "<br /> All Day Parking: " + CurrencyConverter.formatCurrency( parkingAccessCost);
    }

    @Override
    public Double getCost() {

        return this.hotel.getCost() + parkingAccessCost;
    }


}

package com.hmservice.hotel;

import java.util.HashMap;

public class RoomTypeQueen extends Hotel {
    HashMap<String, Double> gcCostMultiplier = new HashMap<>();


    public RoomTypeQueen(Integer gc) {
        guestCount = gc;
        //TODO: Read from DB
        basePrice = 110.00;

        gcCostMultiplier.put("1", 1.00);
        gcCostMultiplier.put("2", 1.10);
        gcCostMultiplier.put("3", 1.20);
        gcCostMultiplier.put("4", 1.25);
    }

    @Override
    public String getPriceBreakdown() {
        return hotelName + "\n Room: Queen \n Guests:" + this.guestCount;
    }

    @Override
    public Double getCost() {
        //consider the number of guests.
        //get cost of room type, and guest limitation for room type
        //auto-select number of rooms to accommodate guests
        Double multiplier = gcCostMultiplier.get(this.guestCount.toString());
        return basePrice * multiplier;
    }
}

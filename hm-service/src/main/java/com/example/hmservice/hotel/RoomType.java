package com.example.hmservice.hotel;

import java.util.HashMap;

public class RoomType extends Hotel {
    String roomTypeCode;
    HashMap<String, Double> roomTypeCostMultiplier = new HashMap<>();


    public RoomType(Integer gc, String rtc) {
        guestCount = gc;
        this.roomTypeCode = rtc;
        //TODO: Read from DB
        roomTypeCostMultiplier.put("SIG", 1.00);
        roomTypeCostMultiplier.put("DBL", 1.10);
        roomTypeCostMultiplier.put("QN", 1.20);
        roomTypeCostMultiplier.put("KNG", 1.25);
        roomTypeCostMultiplier.put("STE", 2.5);
    }

    @Override
    public String getPriceBreakdown() {
        return hotelName + "\n Room: " + roomTypeCode;
    }

    @Override
    public Double getCost() {
        //consider the number of guests.
        //get cost of room type, and guest limitation for room type
        //auto-select number of rooms to accommodate guests
        Double multiplier = roomTypeCostMultiplier.get(roomTypeCode);
        return basePrice * multiplier;
    }
}

package com.example.hmservice.hotel;

public class RoomType extends Hotel {
    Hotel hotel;

    public RoomType(Hotel h) {
        this.hotel = h;
    }

    @Override
    public String getPriceBreakdown() {
        return null;
    }

    @Override
    public Double getCost() {
        //consider the number of guests.
        //get cost of room type, and guest limitation for room type
        //auto-select number of rooms to accommodate guests
        return this.hotel.basePrice;
    }
}

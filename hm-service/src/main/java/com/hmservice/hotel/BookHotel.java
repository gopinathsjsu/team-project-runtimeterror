package com.hmservice.hotel;

import com.hmservice.contract.Amenity;
import com.hmservice.contract.BookingRequest;
import com.hmservice.contract.BookingResponse;
import com.hmservice.contract.RoomRequest;
import com.hmservice.hotel.pricingstrategy.CustomerProfilePlaceholder;
import com.hmservice.hotel.pricingstrategy.IPricingStrategy;

public class BookHotel {
    /*
    Variables:
        Must select a hotel. That has a base price.
            then, must select number of guests.
                then, must select room type (some room types have number of guest capacity).
                    then, optionally, can add on amenities (none or multiple).

       The overall price from all these selections can now be modified with the active pricing strategy
    */

    /*
    the book method in this class would expect
        - hotel id
        - guest count
        - room type
        - amenity (type, count)
     */
    public static BookingResponse book(RoomRequest roomRequest, Hotel booked, IPricingStrategy pricingStrategy) {
        BookingResponse response = new BookingResponse();
        for (Amenity amenity : roomRequest.Amenities) {
            switch (amenity.AmenityCode) {
                case "CB":
                    for(int i = 0; i<amenity.Count; i++) {
                        booked = new DailyBreakfast(booked);
                    }
                    break;
                case "FR":
                    for(int i = 0; i<amenity.Count; i++) {
                        booked = new FitnessRoomAccess(booked);
                    }
                    break;
                case "SW":
                    for(int i = 0; i<amenity.Count; i++) {
                        booked = new SwimmingPoolAccess(booked);
                    }
                    break;
                case "PK":
                    for(int i = 0; i<amenity.Count; i++) {
                        booked = new Parking(booked);
                    }
                    break;
                case "AM":
                    for(int i = 0; i<amenity.Count; i++) {
                        booked = new AllMealsIncluded(booked);
                    }
                    break;
            }
        }

        // Hardcoded pricing strategy;
        response.BookingTotal = booked.getCost() * pricingStrategy.getPricingStrategy(roomRequest.Date, CustomerProfilePlaceholder.REGULAR);
        response.BookingDetails = booked.getPriceBreakdown();
        response.Status = 200;
        return response;
    }
}

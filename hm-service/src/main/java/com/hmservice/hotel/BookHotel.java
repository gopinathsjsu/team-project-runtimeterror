package com.hmservice.hotel;

import com.hmservice.contract.request.Amenity;
import com.hmservice.contract.request.BookingRequest;
import com.hmservice.contract.response.BookingResponse;
import com.hmservice.hotel.pricingstrategy.CustomerProfilePlaceholder;
import com.hmservice.hotel.pricingstrategy.IPricingStrategy;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;

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
    public static BookingResponse book(BookingRequest roomRequest, float loyaltyPoints, Hotel booked, IPricingStrategy pricingStrategy) throws ParseException {

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
        SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy", Locale.ENGLISH);
        Double pricingStrategyMultiplier = pricingStrategy.getPricingStrategy(formatter.parse(roomRequest.CheckInDate),loyaltyPoints);
        response.BookingTotal = booked.getCost() * roomRequest.RoomCount * pricingStrategyMultiplier;
        response.BookingDetails = booked.getPriceBreakdown() +
                "<br /> Room multiplier: " + roomRequest.RoomCount +
                "<br /> Active Pricing Strategy Multiplier: " + pricingStrategyMultiplier;
        response.Status = 200;
        return response;
    }
}

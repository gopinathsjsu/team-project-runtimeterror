package com.example.hmservice.contract;

import com.fasterxml.jackson.annotation.JsonProperty;

public class BookingRequest {
    @JsonProperty("hotelId")
    public Integer HotelID;
    @JsonProperty("guestCount")
    public Integer GuestCount;
    @JsonProperty("roomTypeCode")
    public String RoomTypeCode;
    @JsonProperty("amenities")
    public Amenity[] Amenities;
}


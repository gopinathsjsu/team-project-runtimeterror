package com.example.hmservice.contract;

import com.fasterxml.jackson.annotation.JsonProperty;

public class BookingRequest {
    @JsonProperty("hotelId")
    private Integer HotelID;
    @JsonProperty("guestCount")
    private Integer GuestCount;
    @JsonProperty("roomTypeCode")
    private String RoomTypeCode;
    @JsonProperty("amenities")
    private Amenity[] Amenities;
}



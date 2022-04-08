package com.hmservice.contract;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.sql.Date;

public class RoomRequest {
    @JsonProperty("hotelId")
    public Integer HotelID;
    @JsonProperty("guestCount")
    public Integer GuestCount;
    @JsonProperty("roomTypeCode")
    public String RoomTypeCode;
    @JsonProperty("amenities")
    public Amenity[] Amenities;
    @JsonFormat(pattern="yyyy-MM-dd", timezone = "America/Los_Angeles")
    public java.sql.Date Date;
}

package com.hmservice.contract;

import java.sql.Date;
import java.util.ArrayList;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;

public class BookingRequest {
    @JsonProperty("userId")
    public Long UserId;
    @JsonProperty("hotelId")
    public Integer HotelId;
    @JsonProperty("roomId")
    public Integer RoomId;
    @JsonProperty("checkInDate")
    public String CheckInDate;
    @JsonProperty("checkOutDate")
    public String CheckOutDate;

    @JsonProperty("guestCount")
    public Integer GuestCount;
    @JsonProperty("roomTypeCode")
    public String RoomTypeCode;
    @JsonProperty("roomCount")
    public Integer RoomCount;
    @JsonProperty("amenities")
    public Amenity[] Amenities;
}



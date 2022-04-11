package com.hmservice.contract;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.sql.Date;

public class RoomRequest {
    @JsonProperty("userId")
    public Long UserId;
    @JsonProperty("hotelId")
    public Integer HotelId;
    @JsonProperty("roomId")
    public Integer RoomId;
    @JsonProperty("checkInDate")
    public Date CheckInDate;
    @JsonProperty("checkOutDate")
    public Date CheckOutDate;

    @JsonProperty("guestCount")
    public Integer GuestCount;
    @JsonProperty("roomTypeCode")
    public String RoomTypeCode;
    @JsonProperty("amenities")
    public Amenity[] Amenities;
}

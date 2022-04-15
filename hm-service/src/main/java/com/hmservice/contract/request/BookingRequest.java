package com.hmservice.contract.request;

import com.fasterxml.jackson.annotation.JsonProperty;

import javax.validation.constraints.Digits;
import javax.validation.constraints.NotBlank;
import java.util.ArrayList;

public class BookingRequest {
     @JsonProperty("userId")
    public Long UserId;

    @JsonProperty("hotelId")
    public Integer HotelId;

    @JsonProperty("roomId")
    public Integer RoomId;

    @JsonProperty("checkInDate")
    @NotBlank(message = "CheckInDate is mandatory")
    public String CheckInDate;

    @JsonProperty("checkOutDate")
    @NotBlank(message = "CheckInDate is mandatory")
    public String CheckOutDate;

    @JsonProperty("guestCount")
    public Integer GuestCount;


    @JsonProperty("guests")
    public ArrayList<Integer> Guests;

    @JsonProperty("roomTypeCode")
    @NotBlank(message = "RoomType Code is mandatory")
    public String RoomTypeCode;

    @JsonProperty("roomCount")
    public Integer RoomCount;

    @JsonProperty("amenities")
    public Amenity[] Amenities;
}



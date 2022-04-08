package com.hmservice.contract;

import java.sql.Date;
import java.util.ArrayList;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;

public class BookingRequest {
    @JsonProperty("booking")
    public ArrayList<RoomRequest> Rooms;
}



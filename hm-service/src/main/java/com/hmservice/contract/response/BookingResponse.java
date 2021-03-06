package com.hmservice.contract.response;

import com.fasterxml.jackson.annotation.JsonProperty;

public class BookingResponse {
    @JsonProperty("status")
    public Integer Status;
    @JsonProperty("failureReason")
    public String FailureReason;
    @JsonProperty("bookingDetails")
    public String BookingDetails;
    @JsonProperty("bookingTotal")
    public Double BookingTotal;
    @JsonProperty("bookingId")
    public Integer BookingId;
}

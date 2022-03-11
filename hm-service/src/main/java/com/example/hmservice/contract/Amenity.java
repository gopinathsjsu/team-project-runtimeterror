package com.example.hmservice.contract;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Amenity {
    @JsonProperty("amenityCode")
    private String AmenityCode;
    @JsonProperty("count")
    private Integer Count;
}

package com.hmservice.contract;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Amenity {
    @JsonProperty("amenityCode")
    public String AmenityCode;
    @JsonProperty("count")
    public Integer Count;
}

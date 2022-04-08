package com.hmservice.hotel.controller;

import com.hmservice.contract.SearchRequest;
import com.hmservice.contract.SearchResponse;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

public class HotelSearchController {
    @PostMapping(path = "/hotel/search",
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public SearchResponse searchHotel(@RequestBody SearchRequest searchRequest) {
        return null;
    }

}

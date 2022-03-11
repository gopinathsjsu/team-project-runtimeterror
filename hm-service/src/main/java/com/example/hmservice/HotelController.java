package com.example.hmservice;

import com.example.hmservice.contract.BookingRequest;
import com.example.hmservice.contract.BookingResponse;
import com.example.hmservice.contract.SearchRequest;
import com.example.hmservice.contract.SearchResponse;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HotelController {
    @PostMapping(path = "/hotel/search",
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public SearchResponse searchHotel(@RequestBody SearchRequest searchRequest) {
        return null;
    }

    @PostMapping(path = "/hotel/book",
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public BookingResponse bookHotel(@RequestBody BookingRequest bookingRequest) {
        return null;
    }
}

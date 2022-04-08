package com.hmservice.hotel.controller;

import com.hmservice.contract.SearchRequest;
import com.hmservice.contract.SearchResponse;
import com.hmservice.hotel.models.hotels;
import com.hmservice.repository.HotelRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller	// This means that this class is a Controller
@RequestMapping(path="/hotel")
public class HotelSearchController {

    @Autowired
    private HotelRepository hotelRepo;

    @GetMapping(path = "/all")
    public  @ResponseBody Iterable<hotels> searchHotel() {

        return hotelRepo.findAll();
    }

}

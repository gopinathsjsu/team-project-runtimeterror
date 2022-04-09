package com.hmservice.hotel.controller;

import com.hmservice.contract.SearchRequest;
import com.hmservice.contract.SearchResponse;
import com.hmservice.hotel.models.hotels;
import com.hmservice.hotel.models.room;
import com.hmservice.repository.HotelRepository;
import com.hmservice.repository.RoomRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller	// This means that this class is a Controller
@RequestMapping(path="/hotel/search")
public class HotelSearchController {

    @Autowired
    private HotelRepository hotelRepo;
    @Autowired
    private RoomRepository roomRepository;
    @GetMapping(path = "")
    public  @ResponseBody Iterable<hotels> searchHotel() {
        return hotelRepo.findAll();
    }

    @GetMapping(path = "/{hotelId}/rooms")
    public  @ResponseBody Iterable<room> searchHotelRooms(@PathVariable  Integer hotelId) {
        return roomRepository.findRoomByHotelId(hotelId);
    }

}

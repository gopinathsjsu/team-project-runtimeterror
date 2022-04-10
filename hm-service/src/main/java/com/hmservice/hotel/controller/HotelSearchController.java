package com.hmservice.hotel.controller;

import com.hmservice.hotel.models.Amenity;
import com.hmservice.hotel.models.Hotel;
import com.hmservice.hotel.models.Room;
import com.hmservice.repository.AmenityRepository;
import com.hmservice.repository.HotelRepository;
import com.hmservice.repository.RoomRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/hotel")
public class HotelSearchController {

    @Autowired
    private HotelRepository hotelRepo;
    @Autowired
    private RoomRepository roomRepository;
    @Autowired
    private AmenityRepository amenityRepository;
    @GetMapping(path = "")
    public  @ResponseBody Iterable<Hotel> searchHotel() {
        return hotelRepo.findAll();
    }

    @GetMapping(path = "/{hotelId}/rooms")
    public  @ResponseBody Iterable<Room> searchHotelRooms(@PathVariable  Integer hotelId) {
        return roomRepository.findRoomByHotelId(hotelId);
    }

    @GetMapping(path = "/{hotelId}/amenities")
    public  @ResponseBody Iterable<Amenity> searchHotelAmenities(@PathVariable  Integer hotelId) {
        return amenityRepository.findAmenitiesByHotelId(hotelId);
    }
}

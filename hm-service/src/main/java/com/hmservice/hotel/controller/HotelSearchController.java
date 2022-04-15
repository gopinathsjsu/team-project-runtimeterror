package com.hmservice.hotel.controller;

import com.hmservice.hotel.models.Amenity;
import com.hmservice.hotel.models.Hotel;
import com.hmservice.hotel.models.Room;
import com.hmservice.repository.AmenityRepository;
import com.hmservice.repository.HotelRepository;
import com.hmservice.repository.RoomRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.*;

import javax.validation.ConstraintViolationException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/hotel")
@Validated
public class HotelSearchController {

    @Autowired
    private HotelRepository hotelRepo;
    @Autowired
    private RoomRepository roomRepository;
    @Autowired

    private AmenityRepository amenityRepository;

    @GetMapping(path = "")
    public @ResponseBody
    ResponseEntity<List<Hotel>> searchHotel() {
        return ResponseEntity.ok(hotelRepo.findAll());
    }

    @GetMapping(path = "/{hotelId}/rooms")
    public @ResponseBody
    ResponseEntity<List<Room>> searchHotelRooms(@PathVariable Integer hotelId) {
        return ResponseEntity.ok(roomRepository.findRoomByHotelId(hotelId));
    }

    @GetMapping(path = "/{hotelId}/amenities")
    public @ResponseBody
    Iterable<Amenity> searchHotelAmenities(@PathVariable Integer hotelId) {
        return amenityRepository.findAmenitiesByHotelId(hotelId);
    }

    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public Map<String, String> handleValidationExceptions(
            MethodArgumentNotValidException ex) {
        Map<String, String> errors = new HashMap<>();
        ex.getBindingResult().getAllErrors().forEach((error) -> {
            String fieldName = ((FieldError) error).getField();
            String errorMessage = error.getDefaultMessage();
            errors.put(fieldName, errorMessage);
        });
        return errors;
    }

    @ExceptionHandler(ConstraintViolationException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    ResponseEntity<String> handleConstraintViolationException(ConstraintViolationException e) {
        return new ResponseEntity<>("not valid due to validation error: " + e.getMessage(), HttpStatus.BAD_REQUEST);
    }
}

package com.hmservice.hotel.controller;

import com.hmservice.contract.*;
import com.hmservice.hotel.BookHotel;
import com.hmservice.hotel.Hotel;
import com.hmservice.hotel.RoomFactory;
import com.hmservice.hotel.models.Booking;
import com.hmservice.hotel.pricingstrategy.DynamicPricing;
import com.hmservice.hotel.pricingstrategy.IPricingStrategy;
import com.hmservice.repository.BookingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;


@RequestMapping("/api/booking")
@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
public class HotelBookingController {

    @Autowired
    BookingRepository bookingRepository;


    @PostMapping(path = "/calculate",
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    @PreAuthorize("hasRole('CUSTOMER') or hasRole('EMPLOYEE') or hasRole('ADMIN')")
    public ArrayList<Object> calculateBookingCost(@Valid @RequestBody  ArrayList<Booking> bookingRequest) {
        IPricingStrategy strategy = new DynamicPricing();
        ArrayList<Object> resp = new ArrayList<>();

        bookingRequest.forEach(booking -> {

            Hotel room = RoomFactory.GetRoom(booking.getRoomTypeCode(), booking.getGuestCount());
            booking.setBookingDate("4-10-2022");
            booking.setTotalPrice(100);
           // bookingRepository.save(booking);
            resp.add(booking);
        });

        return  resp;
    }

    @PostMapping(path = "",
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    @PreAuthorize("hasRole('CUSTOMER') or hasRole('EMPLOYEE') or hasRole('ADMIN')")
    public ArrayList<Object> bookHotel(@Valid @RequestBody  ArrayList<Booking> bookingRequest) {
      IPricingStrategy strategy = new DynamicPricing();
        ArrayList<Object> resp = new ArrayList<>();

        bookingRequest.forEach(booking -> {

          Hotel room = RoomFactory.GetRoom(booking.getRoomTypeCode(), booking.getGuestCount());
          booking.setBookingDate("4-10-2022");
          booking.setTotalPrice(100);
                bookingRepository.save(booking);
          resp.add(booking);
        });

        return  resp;
    }

//    @GetMapping("/{id}")
//    @PreAuthorize("hasRole('CUSTOMER') or hasRole('ADMIN')")
//    public ResponseEntity<Booking> getReservationByUsername(@PathVariable Long id) {
//        Reservation reservation = reservationService.findById(id);
//        return new ResponseEntity<>(reservation, HttpStatus.OK);
//    }
//
//    @PutMapping("/{id}")
//    public ResponseEntity<Map<String, Boolean>> updateReservation(@PathVariable Long id,
//                                                                  @Valid @RequestBody Booking booking) {
//        reservation.setId(id);
//        reservationService.updateReservation(reservation);
//        Map<String, Boolean> map = new HashMap<>();
//        map.put("success", true);
//        return new ResponseEntity<>(map, HttpStatus.CREATED);
//    }
//
//    @DeleteMapping("/{id}")
//    public ResponseEntity<Map<String, Boolean>> deleteReservation(@PathVariable Long id) {
//        reservationService.deleteReservation(id);
//        Map<String, Boolean> map = new HashMap<>();
//        map.put("success", true);
//        return new ResponseEntity<>(map, HttpStatus.OK);
//    }
}

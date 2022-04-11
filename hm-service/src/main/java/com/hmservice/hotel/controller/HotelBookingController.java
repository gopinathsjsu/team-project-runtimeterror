package com.hmservice.hotel.controller;


import com.hmservice.contract.BookingRequest;
import com.hmservice.hotel.Hotel;
import com.hmservice.hotel.RoomFactory;
import com.hmservice.hotel.models.Booking;
import com.hmservice.hotel.models.BookingHotelAmenities;
import com.hmservice.hotel.pricingstrategy.DynamicPricing;
import com.hmservice.hotel.pricingstrategy.IPricingStrategy;
import com.hmservice.repository.BookingHotelAmenitiesRepository;
import com.hmservice.repository.BookingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.*;


@RequestMapping("/api/booking")
@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
public class HotelBookingController {

    @Autowired
    BookingRepository bookingRepository;

@Autowired
    BookingHotelAmenitiesRepository bookingHotelAmenitiesRepository;
    @PostMapping(path = "/calculate",
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    @PreAuthorize("hasRole('CUSTOMER') or hasRole('EMPLOYEE') or hasRole('ADMIN')")
    public ArrayList<Object> calculateBookingCost(@Valid @RequestBody  ArrayList<Booking> bookingRequest) {
        IPricingStrategy strategy = new DynamicPricing();
        ArrayList<Object> resp = new ArrayList<>();

        bookingRequest.forEach(booking -> {
            Hotel room = RoomFactory.GetRoom(booking.getRoomTypeCode(), booking.getGuestCount());
            booking.setBookingDate(new Date());
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
    public ArrayList<Object> bookHotel(@Valid @RequestBody  BookingRequest bookingRequest) {
      IPricingStrategy strategy = new DynamicPricing();
        ArrayList<Object> resp = new ArrayList<>();

        bookingRequest.Rooms.forEach(booking -> {

          Hotel room = RoomFactory.GetRoom(booking.RoomTypeCode, booking.GuestCount);

          Booking hotelBooking  = new Booking();
            hotelBooking.setUserId(booking.UserId);
            hotelBooking.setHotelId(booking.HotelId);
            hotelBooking.setRoomId(booking.RoomId);
            hotelBooking.setCheckInDate(booking.CheckInDate);
            hotelBooking.setCheckOutDate(booking.CheckOutDate);
            hotelBooking.setGuestCount(booking.GuestCount);
            hotelBooking.setRoomTypeCode(booking.RoomTypeCode);

            Set<BookingHotelAmenities> amenities =  new HashSet<>();
            for (int i=0; i < booking.Amenities.length; i++) {
                BookingHotelAmenities a= new BookingHotelAmenities(hotelBooking,booking.Amenities[i].HotelAmenityId, booking.Amenities[i].Count);
                amenities.add(a);
            }


            bookingRepository.save(hotelBooking);

            for ( BookingHotelAmenities ba : amenities) {
                ba.setBooking(hotelBooking);
                bookingHotelAmenitiesRepository.save(ba);
            }



          resp.add(hotelBooking);
        });

        return  resp;
    }

    @GetMapping("/getbookingbyuserid/{id}")
    @PreAuthorize("hasRole('CUSTOMER') or hasRole('ADMIN')")
    public ResponseEntity<List<Booking>> getBookingByUserId(@PathVariable Long id) {

        return new ResponseEntity<>(bookingRepository.findByUserId(id), HttpStatus.OK);
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasRole('CUSTOMER') or hasRole('ADMIN')")
    public ResponseEntity<Optional<Booking>> getBookingById(@PathVariable Long id) {

        return new ResponseEntity<>(bookingRepository.findById(id), HttpStatus.OK);
    }
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

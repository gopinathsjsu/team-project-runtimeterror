package com.hmservice.hotel.controller;


import com.hmservice.contract.BookingRequest;
import com.hmservice.contract.BookingResponse;
import com.hmservice.hotel.BookHotel;
import com.hmservice.hotel.Hotel;
import com.hmservice.hotel.RoomFactory;
import com.hmservice.hotel.models.Booking;
import com.hmservice.hotel.models.BookingHotelAmenities;
import com.hmservice.hotel.models.BookingRooms;
import com.hmservice.hotel.pricingstrategy.DynamicPricing;
import com.hmservice.hotel.pricingstrategy.IPricingStrategy;
import com.hmservice.repository.BookingHotelAmenitiesRepository;
import com.hmservice.repository.BookingRepository;
import com.hmservice.repository.BookingRoomsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;


@RequestMapping("/api/booking")
@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
public class HotelBookingController {

    @Autowired
    BookingRepository bookingRepository;

    @Autowired
    BookingHotelAmenitiesRepository bookingHotelAmenitiesRepository;

    @Autowired
    BookingRoomsRepository bookingRoomsRepository;

    @PostMapping(path = "/calculate",
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    @PreAuthorize("hasRole('CUSTOMER') or hasRole('EMPLOYEE') or hasRole('ADMIN')")
    public ResponseEntity<?> calculateBookingCost(@Valid @RequestBody BookingRequest bookingRequest) throws ParseException {
        IPricingStrategy strategy = new DynamicPricing();



            Hotel room = RoomFactory.GetRoom(bookingRequest.RoomTypeCode, bookingRequest.GuestCount);
            BookingResponse resp =  BookHotel.book(bookingRequest, room, strategy );


        return ResponseEntity.ok(resp);
    }

    @PostMapping(path = "",
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    @PreAuthorize("hasRole('CUSTOMER') or hasRole('EMPLOYEE') or hasRole('ADMIN')")
    public ResponseEntity<?> bookHotel(@Valid @RequestBody BookingRequest bookingRequest) throws ParseException {
        IPricingStrategy strategy = new DynamicPricing();

        // TODO : Ability to get prices for individual room types
        // TODO : FACTOR IN ROOM COUNT
        Hotel room = RoomFactory.GetRoom(bookingRequest.RoomTypeCode, bookingRequest.GuestCount);
        BookingResponse resp =  BookHotel.book(bookingRequest, room, strategy );

        Booking hotelBooking = new Booking();
        SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy", Locale.ENGLISH);

        hotelBooking.setUserId(bookingRequest.UserId);
        hotelBooking.setHotelId(bookingRequest.HotelId);
        hotelBooking.setCheckInDate(formatter.parse(bookingRequest.CheckInDate));
        hotelBooking.setCheckOutDate(formatter.parse(bookingRequest.CheckOutDate));
        hotelBooking.setGuestCount(bookingRequest.GuestCount);
        hotelBooking.setRoomTypeCode(bookingRequest.RoomTypeCode);
        hotelBooking.setBookingDate(new Date());
        hotelBooking.setTotalPrice(resp.BookingTotal);

        Set<BookingHotelAmenities> amenities = new HashSet<>();


        bookingRepository.save(hotelBooking);

        for (int i = 0; i < bookingRequest.Amenities.length; i++) {
            BookingHotelAmenities ba = new BookingHotelAmenities(hotelBooking, bookingRequest.Amenities[i].HotelAmenityId, bookingRequest.Amenities[i].Count);
            bookingHotelAmenitiesRepository.save(ba);
        }


        for (int i = 0; i < bookingRequest.RoomCount; i++) {
            BookingRooms br = new BookingRooms(hotelBooking, bookingRequest.RoomId);
            bookingRoomsRepository.save(br);
        }

        return ResponseEntity.ok(resp);

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

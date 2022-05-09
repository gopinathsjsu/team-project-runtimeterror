package com.hmservice.hotel.controller;


import com.hmservice.contract.request.BookingRequest;
import com.hmservice.contract.response.BookingResponse;
import com.hmservice.contract.response.MessageResponse;
import com.hmservice.hotel.BookHotel;
import com.hmservice.hotel.Hotel;
import com.hmservice.hotel.RoomFactory;
import com.hmservice.hotel.models.Booking;
import com.hmservice.hotel.models.BookingRooms;
import com.hmservice.hotel.models.User;
import com.hmservice.hotel.pricingstrategy.DynamicPricing;
import com.hmservice.hotel.pricingstrategy.IPricingStrategy;
import com.hmservice.hotel.pricingstrategy.PricingStrategyFactory;
import com.hmservice.repository.BookingRepository;
import com.hmservice.repository.BookingRoomsRepository;
import com.hmservice.repository.PricingStrategyRepository;
import com.hmservice.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.*;

import javax.validation.ConstraintViolationException;
import javax.validation.Valid;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.concurrent.TimeUnit;


@RequestMapping("/api/booking")
@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@Validated
public class HotelBookingController {

    @Autowired
    BookingRepository bookingRepository;
    @Autowired
    PricingStrategyRepository pricingStrategyRepository;
    @Autowired
    BookingRoomsRepository bookingRoomsRepository;
    @Autowired
    UserRepository userRepository;

    SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy", Locale.ENGLISH);

    @PostMapping(path = "/calculate",
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    @PreAuthorize("hasRole('CUSTOMER') or hasRole('EMPLOYEE') or hasRole('ADMIN')")
    public ResponseEntity<?> calculateBookingCost(@Valid @RequestBody BookingRequest bookingRequest) {
        IPricingStrategy strategy = PricingStrategyFactory.GetStrategy(pricingStrategyRepository.getActiveStrategy().get().getShortCode());
        Hotel room = RoomFactory.GetRoom(bookingRequest.RoomTypeCode, bookingRequest.GuestCount, bookingRequest.RoomCount);

        Optional<User> u = userRepository.findById(bookingRequest.UserId);
        if(!u.isPresent()){
            return new ResponseEntity<>("user not found", HttpStatus.BAD_REQUEST);
        }

        try {

            if(durationValidation(bookingRequest) >7){
                return new ResponseEntity<>("Checkout data cannot be more than 7 days from check-in date", HttpStatus.BAD_REQUEST);
            }

            BookingResponse resp = BookHotel.book(bookingRequest, u.get().getLoyalty(), room, strategy);
            return ResponseEntity.ok(resp);
        } catch (Exception ex) {
            return new ResponseEntity<>(ex.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PostMapping(path = "",
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    @PreAuthorize("hasRole('CUSTOMER') or hasRole('EMPLOYEE') or hasRole('ADMIN')")
    public ResponseEntity<?> bookHotel(@Valid @RequestBody BookingRequest bookingRequest) {
        BookingResponse resp;

        try {

            if(durationValidation(bookingRequest) >7){
                return new ResponseEntity<>("Checkout data cannot be more than 7 days from check-in date", HttpStatus.BAD_REQUEST);
            }

            IPricingStrategy strategy = PricingStrategyFactory.GetStrategy(pricingStrategyRepository.getActiveStrategy().get().getShortCode());
            Optional<User> u = userRepository.findById(bookingRequest.UserId);
            if(!u.isPresent()){
                return new ResponseEntity<>("user not found", HttpStatus.BAD_REQUEST);
            }
            // TODO : Ability to get prices for individual room types
            // TODO : FACTOR IN ROOM COUNT
            Hotel room = RoomFactory.GetRoom(bookingRequest.RoomTypeCode, bookingRequest.GuestCount, bookingRequest.RoomCount);

            resp = BookHotel.book(bookingRequest, u.get().getLoyalty(), room, strategy);

            Booking hotelBooking = new Booking(bookingRequest.UserId, bookingRequest.HotelId, true, new Date(),
                    formatter.parse(bookingRequest.CheckInDate), formatter.parse(bookingRequest.CheckOutDate),
                    bookingRequest.RoomTypeCode, bookingRequest.GuestCount, resp.BookingTotal,
                    resp.BookingDetails);

            bookingRepository.save(hotelBooking);

            for (int i = 0; i < bookingRequest.RoomCount; i++) {
                bookingRoomsRepository.save(new BookingRooms(hotelBooking, bookingRequest.RoomId, true));
            }

            // ADD Loyalty points



            u.get().setLoyalty(u.get().getLoyalty() + (float) (bookingRequest.RoomCount * 100.00));
            userRepository.save(u.get());

            resp.BookingId = hotelBooking.getId().intValue();
            return ResponseEntity.ok(resp);

        } catch (Exception ex) {
            return new ResponseEntity<>(ex.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasRole('CUSTOMER') or hasRole('ADMIN')")
    public ResponseEntity<?> updateReservation(@PathVariable Long id, @Valid @RequestBody BookingRequest bookingRequest) {
        Optional<Booking> booking = bookingRepository.findById(id);
        BookingResponse resp;
        if (booking.isPresent()) {
            try {
                if(durationValidation(bookingRequest) >7){
                    return new ResponseEntity<>("Checkout data cannot be more than 7 days from check-in date", HttpStatus.BAD_REQUEST);
                }

                IPricingStrategy strategy = PricingStrategyFactory.GetStrategy(pricingStrategyRepository.getActiveStrategy().get().getShortCode());
                // TODO : Ability to get prices for individual room types
                // TODO : FACTOR IN ROOM COUNT
                Optional<User> u = userRepository.findById(bookingRequest.UserId);
                if(u.isEmpty()){
                    return new ResponseEntity<>("user not found", HttpStatus.BAD_REQUEST);
                }

                Hotel room = RoomFactory.GetRoom(bookingRequest.RoomTypeCode, bookingRequest.GuestCount , bookingRequest.RoomCount);
                resp = BookHotel.book(bookingRequest, u.get().getLoyalty(), room, strategy);
                Booking hotelBooking = booking.get();

                if (bookingRequest.HotelId != 0) {
                    hotelBooking.setHotelId(bookingRequest.HotelId);
                }

                if (!bookingRequest.CheckInDate.isEmpty()) {
                    hotelBooking.setCheckInDate(formatter.parse(bookingRequest.CheckInDate));
                }

                if (!bookingRequest.CheckOutDate.isEmpty()) {
                    hotelBooking.setCheckOutDate(formatter.parse(bookingRequest.CheckOutDate));
                }

                if (bookingRequest.GuestCount != 0) {
                    hotelBooking.setGuestCount(bookingRequest.GuestCount);
                }

                if (!bookingRequest.RoomTypeCode.isEmpty()) {
                    hotelBooking.setRoomTypeCode(bookingRequest.RoomTypeCode);
                }

                if (bookingRequest.HotelId != 0) {
                    hotelBooking.setHotelId(bookingRequest.HotelId);
                }


                bookingRepository.save(hotelBooking);

                List<BookingRooms> prevRooms = bookingRoomsRepository.findRoomsByBookingId(hotelBooking.getId());
                prevRooms.forEach(r -> {
                    r.setActive(false);
                    bookingRoomsRepository.save(r);
                });


                for (int i = 0; i < bookingRequest.RoomCount; i++) {
                    bookingRoomsRepository.save(new BookingRooms(hotelBooking, bookingRequest.RoomId, true));
                }

                resp.BookingId = hotelBooking.getId().intValue();
                return ResponseEntity.ok(resp);
            } catch (Exception ex) {
                return new ResponseEntity<>(ex.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
            }
        }

        return new ResponseEntity<>("BOOKING ID NOT FOUND", HttpStatus.NOT_FOUND);
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasRole('CUSTOMER') or hasRole('ADMIN')")
    public ResponseEntity<?> deleteReservation(@PathVariable Long id) {
        Optional<Booking> booking = bookingRepository.findById(id);

        if (booking.isPresent()) {
            Booking hotelBooking = booking.get();
            hotelBooking.setActive(false);
            bookingRepository.save(hotelBooking);

            List<BookingRooms> prevRooms = bookingRoomsRepository.findRoomsByBookingId(hotelBooking.getId());
            prevRooms.forEach(r -> {
                r.setActive(false);
                bookingRoomsRepository.save(r);
            });

            return new ResponseEntity<>("BOOKING Removed", HttpStatus.OK);
        }
        return new ResponseEntity<>("BOOKING ID NOT FOUND", HttpStatus.NOT_FOUND);
    }

    @GetMapping("/getbookingbyuserid/{id}")
    @PreAuthorize("hasRole('CUSTOMER') or hasRole('ADMIN')")
    public ResponseEntity<List<Booking>> getBookingByUserId(@PathVariable Long id) {

        return new ResponseEntity<>(bookingRepository.findByUserId(id), HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getBookingById(@PathVariable Long id) {
        Optional<Booking> booking = bookingRepository.findById(id);
        if (booking.isPresent()) {
            return new ResponseEntity<>(booking.get(), HttpStatus.OK);
        }

        return new ResponseEntity<>("BOOKING ID NOT FOUND", HttpStatus.NOT_FOUND);
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

    private  long durationValidation (BookingRequest bookingRequest) throws ParseException {
        // Duration validation
        Date firstDate = formatter.parse(bookingRequest.CheckInDate.toString());
        Date secondDate = formatter.parse(bookingRequest.CheckOutDate);
        long diffInMillies = Math.abs(secondDate.getTime() - firstDate.getTime());
        long diff = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);

        return  diff;
    }
}

package com.hmservice.hotel.controller;

import com.hmservice.contract.*;
import com.hmservice.hotel.BookHotel;
import com.hmservice.hotel.Hotel;
import com.hmservice.hotel.RoomFactory;
import com.hmservice.hotel.pricingstrategy.DynamicPricing;
import com.hmservice.hotel.pricingstrategy.IPricingStrategy;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

@RestController
public class HotelBookingController {

    @PostMapping(path = "/hotel/book",
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ArrayList<Object> bookHotel(@RequestBody BookingRequest bookingRequest) {
      IPricingStrategy strategy = new DynamicPricing();
        ArrayList<Object> resp = new ArrayList<>();
      for (RoomRequest roomReaquest : bookingRequest.Rooms) {
          Hotel room = RoomFactory.GetRoom(roomReaquest.RoomTypeCode, roomReaquest.GuestCount);
         resp.add(BookHotel.book(roomReaquest, room, strategy));
      }
      return resp;
    }
}

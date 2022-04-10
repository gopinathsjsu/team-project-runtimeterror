package com.hmservice.hotel.controller;

import com.hmservice.contract.*;
import com.hmservice.hotel.BookHotel;
import com.hmservice.hotel.Hotel;
import com.hmservice.hotel.RoomFactory;
import com.hmservice.hotel.pricingstrategy.DynamicPricing;
import com.hmservice.hotel.pricingstrategy.IPricingStrategy;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@Controller
@RequestMapping("/api/booking")
@CrossOrigin(origins = "*", maxAge = 3600)
public class HotelBookingController {

    @PostMapping(path = "",
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

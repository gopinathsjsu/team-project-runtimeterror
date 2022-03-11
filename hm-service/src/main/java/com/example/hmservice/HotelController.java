package com.example.hmservice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HotelController {
    @GetMapping("/hotel/search")
    public HealthCheck searchHotel (){
        return new HealthCheck();
    }

    @GetMapping("/hotel/book")
    public HealthCheck bookHotel (){
        return new HealthCheck();
    }
}

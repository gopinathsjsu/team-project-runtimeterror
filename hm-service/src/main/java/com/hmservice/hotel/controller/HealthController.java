package com.hmservice.hotel.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HealthController {

    @GetMapping("/health")
    public HealthCheck getHealthCheck (){
        return new HealthCheck();
    }


}

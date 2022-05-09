package com.hmservice.hotel.controller;

import com.hmservice.hotel.models.PricingStrategy;
import com.hmservice.repository.PricingStrategyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/admin")
public class AdminController {
@Autowired
    PricingStrategyRepository pricingStrategyRepository;

    @GetMapping("/pricingstrategy")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<List<PricingStrategy>> getAllPricingStrategy() {
        return  ResponseEntity.ok(pricingStrategyRepository.findAll());
    }

    @PutMapping("/pricingstrategy")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<String> updatePricingStrategy(@Valid @RequestBody ArrayList<PricingStrategy> pricingStrategy) {

        pricingStrategy.forEach(p ->{
            pricingStrategyRepository.save(p);
        });
        return ResponseEntity.ok("Pricing Strategies Updated");
    }
}

package com.hmservice.repository;

import com.hmservice.hotel.models.PricingStrategy;
import com.hmservice.hotel.models.Room;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface PricingStrategyRepository extends JpaRepository<PricingStrategy, Integer> {
    @Query(value = "SELECT * from pricing_strategy where active= true", nativeQuery = true)
    Optional<PricingStrategy> getActiveStrategy();
}

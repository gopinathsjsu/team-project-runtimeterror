package com.hmservice.repository;

import com.hmservice.hotel.models.PricingStrategy;
import com.hmservice.hotel.models.Room;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PricingStrategyRepository extends JpaRepository<PricingStrategy, Integer> {

}

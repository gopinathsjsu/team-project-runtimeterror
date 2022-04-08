package com.hmservice.repository;

import com.hmservice.hotel.models.hotels;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

public interface HotelRepository extends JpaRepository<hotels, Integer> {
}

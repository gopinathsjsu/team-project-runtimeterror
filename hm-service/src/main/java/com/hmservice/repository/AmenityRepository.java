package com.hmservice.repository;

import com.hmservice.hotel.models.Amenity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AmenityRepository extends JpaRepository<Amenity, Long> {
    List<Amenity> findAmenitiesByHotelId(Integer hotelId);
}

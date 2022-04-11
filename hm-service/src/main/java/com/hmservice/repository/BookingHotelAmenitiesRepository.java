package com.hmservice.repository;

import com.hmservice.hotel.models.Booking;
import com.hmservice.hotel.models.BookingHotelAmenities;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BookingHotelAmenitiesRepository extends JpaRepository<BookingHotelAmenities, Long> {
}

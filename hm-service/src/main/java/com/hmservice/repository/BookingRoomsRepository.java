package com.hmservice.repository;

import com.hmservice.hotel.models.BookingHotelAmenities;
import com.hmservice.hotel.models.BookingRooms;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BookingRoomsRepository extends JpaRepository<BookingRooms, Long> {
}

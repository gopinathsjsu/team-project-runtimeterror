package com.hmservice.repository;

import com.hmservice.hotel.models.Amenity;
import com.hmservice.hotel.models.BookingHotelAmenities;
import com.hmservice.hotel.models.BookingRooms;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BookingRoomsRepository extends JpaRepository<BookingRooms, Long> {
    List<BookingRooms> findRoomsByBookingId(Long bookingId);
}

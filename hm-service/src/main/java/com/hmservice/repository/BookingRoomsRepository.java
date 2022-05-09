package com.hmservice.repository;

import com.hmservice.hotel.models.BookingRooms;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface BookingRoomsRepository extends JpaRepository<BookingRooms, Long> {
    @Query(value ="SELECT * FROM booking_rooms_map where booking_id= ?1 and active= true", nativeQuery = true)
    List<BookingRooms> findRoomsByBookingId(Long bookingId);
}

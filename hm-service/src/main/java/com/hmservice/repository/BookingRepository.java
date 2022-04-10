package com.hmservice.repository;

import com.hmservice.hotel.models.Booking;
import com.hmservice.hotel.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BookingRepository extends JpaRepository<Booking, Long> {
}

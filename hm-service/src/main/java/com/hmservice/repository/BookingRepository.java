package com.hmservice.repository;

import com.hmservice.hotel.models.Booking;
import com.hmservice.hotel.models.ERole;
import com.hmservice.hotel.models.Role;
import com.hmservice.hotel.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface BookingRepository extends JpaRepository<Booking, Long> {
    List<Booking> findByUserId(Long id);
}

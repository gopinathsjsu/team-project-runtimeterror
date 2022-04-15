package com.hmservice.repository;

import com.hmservice.hotel.models.*;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface BookingRepository extends JpaRepository<Booking, Long> {
    @Query(value = "SELECT * FROM booking where userId = ?1 and active = true" , nativeQuery = true)
    List<Booking> findByUserId(Long id);
    @Query(value = "SELECT * FROM booking where id = ?1 and active = true" , nativeQuery = true)
    Optional<Booking> findById(Long id);
}

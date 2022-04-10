package com.hmservice.repository;

import com.hmservice.hotel.models.hotels;
import com.hmservice.hotel.models.room;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RoomRepository  extends JpaRepository<room, Integer> {
    List<room> findRoomByHotelId(Integer hotelId);
}

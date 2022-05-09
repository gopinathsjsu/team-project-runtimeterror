package com.hmservice.repository;

import com.hmservice.hotel.models.Room;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RoomRepository  extends JpaRepository<Room, Integer> {
    List<Room> findRoomByHotelId(Integer hotelId);
}

package com.example.hmservice.hotel;

public interface IHotelDao {
    double GetRoomCostMultiplier(String roomCode);
    double GetRoomBasePrice(int hotelId);
    double GetAmenityPrice(int amenityId);
}

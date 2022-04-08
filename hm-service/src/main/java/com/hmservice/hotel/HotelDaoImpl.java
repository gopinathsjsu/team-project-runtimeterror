package com.hmservice.hotel;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class HotelDaoImpl implements IHotelDao{
    Connection conn = null;

    public HotelDaoImpl() {
        try {
            // db parameters
            String url       = "jdbc:mysql://localhost:3306/hotels";
            String user      = "root";
            String password  = "";

            // create a connection to the database
            conn = DriverManager.getConnection(url, user, password);
            // more processing here
            // ...
        } catch(SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            try{
                if(conn != null)
                conn.close();
            }catch(SQLException ex){
                System.out.println(ex.getMessage());
            }
        }
    }

    @Override
    public double GetRoomCostMultiplier(String roomCode) {
        return 0;
    }

    @Override
    public double GetRoomBasePrice(int hotelId) {
        return 0;
    }

    @Override
    public double GetAmenityPrice(int amenityId) {
        return 0;
    }
}

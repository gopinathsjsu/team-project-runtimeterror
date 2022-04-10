package com.hmservice.hotel.models;

import javax.persistence.*;

@Entity
@Table(name ="rooms")
public class Room {
    @Id
    @Column(name="id")
    private Integer Id;

    @Column(name="room_type_id",  insertable  = false, updatable = false)
    private Integer room_type_id;

    @OneToOne(cascade=CascadeType.ALL)
    @JoinColumn(name = "room_type_id", referencedColumnName = "id")
    private Room_Type room_type;

    @Column(name="hotel_id",  insertable  = false, updatable = false)
    private  Integer hotelId;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name="hotel_id",referencedColumnName="id", insertable  = false, updatable = false)
    private Hotel hotel;

    @Column(name="price")
    private  Integer price;

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Integer getId() {
        return Id;
    }

    public void setId(Integer id) {
        Id = id;
    }


    public Room_Type getRoom_type() {
        return room_type;
    }

    public void setRoom_type(Room_Type room_type) {
        this.room_type = room_type;
    }

    public Integer getHotelId() {
        return hotelId;
    }

    public void setHotelId(Integer hotelId) {
        this.hotelId = hotelId;
    }

    public Hotel getHotel() {
        return hotel;
    }

    public void setHotel(Hotel hotel) {
        this.hotel = hotel;
    }
}

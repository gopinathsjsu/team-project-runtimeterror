package com.hmservice.hotel.models;

import com.fasterxml.jackson.annotation.JsonBackReference;

import javax.persistence.*;

@Entity
@Table(name = "booking_rooms_map")
public class BookingRooms {

    public BookingRooms() {
    }

    public BookingRooms(Booking booking, Integer hotelRoomId) {

        this.booking = booking;
        this.hotelRoomId = hotelRoomId;
    }

    public Integer getCount() {
        return count;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "count")
    private Integer count;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "booking_id", nullable = false)
    private Booking booking;

    @JsonBackReference
    public Booking getBooking() {
        return booking;
    }

    public void setBooking(Booking booking) {
        this.booking = booking;
    }

    public Long getId() {
        return id;
    }

    public Integer getHotelRoomId() {
        return hotelRoomId;
    }

    public Room getRoom() {
        return room;
    }

    @Column(name = "hotel_room_id")
    private Integer hotelRoomId;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name="hotel_room_id",referencedColumnName="id", insertable  = false, updatable = false)
    private Room room;
}

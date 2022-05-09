package com.hmservice.hotel.models;

import com.fasterxml.jackson.annotation.JsonBackReference;
import org.springframework.lang.Nullable;

import javax.persistence.*;

@Entity
@Table(name = "booking_rooms_map")
public class BookingRooms {

    public BookingRooms() {
    }

    public BookingRooms(Booking booking, Integer hotelRoomId, Boolean active) {
        this.active = active;
        this.booking = booking;
        this.hotelRoomId = hotelRoomId;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Nullable
    @Column(name = "active")
    private Boolean active;

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }

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

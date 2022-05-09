package com.hmservice.hotel.models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import java.io.Serializable;
import java.util.*;
import java.util.stream.Collectors;

@Entity
@Table(name = "booking")
public class Booking implements Serializable {

    public Booking() {
    }

    public Booking(Long userId, Integer hotelId, Boolean active, Date bookingDate, Date checkInDate, Date checkOutDate, String roomTypeCode, Integer guestCount, Double totalPrice, String bookingDetails) {
        this.userId = userId;
        this.hotelId = hotelId;
        this.active = active;
        this.bookingDate = bookingDate;
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
        this.roomTypeCode = roomTypeCode;
        this.guestCount = guestCount;
        this.totalPrice = totalPrice;
        this.bookingDetails = bookingDetails;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "userId")
    private Long userId;

    @Column(name = "hotelId")
    private Integer hotelId;

    private Boolean active;

    @Column(name = "bookingDate")
    private Date bookingDate;

    @Column(name = "checkInDate")
    private Date checkInDate;

    @Column(name = "checkOutDate")
    private Date checkOutDate;

    @Column(name = "roomTypeCode")
    private String roomTypeCode;

    @Column(name = "guestCount")
    private Integer guestCount;

    @Column(name = "totalPrice")
    private Double totalPrice;

    @Column(name = "booking_details")
    private String bookingDetails;

    @OneToMany(mappedBy = "booking", cascade = CascadeType.ALL)
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<BookingRooms> rooms = new ArrayList<>();



    @JsonManagedReference
    public List<BookingRooms> getRooms() {
        return rooms.stream().filter(r -> {
            assert r.getActive() != null;
            return r.getActive().equals(true) || r.getActive() == null;
        }).collect(Collectors.toList());
    }

    public void setRooms(List<BookingRooms> rooms) {
        this.rooms = rooms;
    }


    public Boolean getActive() {
        return active;
    }
    public void setActive(Boolean active) {
        this.active = active;
    }

    public String getBookingDetails() {
        return bookingDetails;
    }

    public void setBookingDetails(String bookingDetails) {
        this.bookingDetails = bookingDetails;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Integer getHotelId() {
        return hotelId;
    }

    public void setHotelId(Integer hotelId) {
        this.hotelId = hotelId;
    }


    public Date getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(Date bookingDate) {
        this.bookingDate = bookingDate;
    }

    public Date getCheckInDate() {
        return checkInDate;
    }

    public void setCheckInDate(Date checkInDate) {
        this.checkInDate = checkInDate;
    }

    public Date getCheckOutDate() {
        return checkOutDate;
    }

    public void setCheckOutDate(Date checkOutDate) {
        this.checkOutDate = checkOutDate;
    }

    public String getRoomTypeCode() {
        return roomTypeCode;
    }

    public void setRoomTypeCode(String roomTypeCode) {
        this.roomTypeCode = roomTypeCode;
    }

    public Integer getGuestCount() {
        return guestCount;
    }

    public void setGuestCount(Integer guestCount) {
        this.guestCount = guestCount;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }
}

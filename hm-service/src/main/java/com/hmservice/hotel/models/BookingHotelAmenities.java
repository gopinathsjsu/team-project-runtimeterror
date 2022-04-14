package com.hmservice.hotel.models;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;

@Entity
@Table(name = "booking_hotel_amenities_map")
public class BookingHotelAmenities {
    public BookingHotelAmenities() {

    }

    public BookingHotelAmenities(Booking booking, Long hotelAmenitiesId, Integer count) {

        this.booking = booking;
        this.hotelAmenitiesId = hotelAmenitiesId;
        this.count = count;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

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

    @Column(name = "hotel_amenities_id")
    private Long hotelAmenitiesId;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name="hotel_amenities_id",referencedColumnName="id", insertable  = false, updatable = false)
    private Amenity amenity;

    @Column(name = "count")
    private Integer count;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }



    public Long getHotelAmenitiesId() {
        return hotelAmenitiesId;
    }

    public void setHotelAmenitiesId(Long hotelAmenitiesId) {
        this.hotelAmenitiesId = hotelAmenitiesId;
    }

    public Amenity getAmenity() {
        return amenity;
    }

    public void setAmenity(Amenity amenity) {
        this.amenity = amenity;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }
}

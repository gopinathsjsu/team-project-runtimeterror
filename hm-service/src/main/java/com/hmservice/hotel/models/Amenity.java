package com.hmservice.hotel.models;

import javax.persistence.*;

@Entity
@Table(name = "hotel_amenities_map")
public class Amenity {

    @Id
    @Column(name = "id")
    private Long Id;

    @Column(name = "hotel_id")
    private Integer hotelId;

    @Column(name = "amenities_id")
    private Integer amenitiesId;

    @OneToOne(cascade=CascadeType.ALL)
    @JoinColumn(name="amenities_id",referencedColumnName="id", insertable  = false, updatable = false)
    private Amenity_Type amenity;

    @Column(name = "cost")
    private Long cost;

    public Long getId() {
        return Id;
    }

    public void setId(Long id) {
        Id = id;
    }

    public Integer getHotelId() {
        return hotelId;
    }

    public void setHotelId(Integer hotelId) {
        this.hotelId = hotelId;
    }

    public Integer getAmenitiesId() {
        return amenitiesId;
    }

    public void setAmenitiesId(Integer amenitiesId) {
        this.amenitiesId = amenitiesId;
    }

    public Amenity_Type getAmenity() {
        return amenity;
    }

    public void setAmenity(Amenity_Type amenity) {
        this.amenity = amenity;
    }

    public Long getCost() {
        return cost;
    }

    public void setCost(Long cost) {
        this.cost = cost;
    }

}

package com.hmservice.hotel;

public abstract class Hotel {
    protected Integer guestCount;
    protected Integer roomCount;
    protected Double basePrice;
    protected String hotelName;

    public abstract String getPriceBreakdown();

    public abstract Double getCost();

}

package com.hmservice.hotel;

public abstract class Hotel {
    protected Integer guestCount;
    protected Double basePrice = 50.00;
    protected String hotelName;

    public abstract String getPriceBreakdown();

    public abstract Double getCost();

}

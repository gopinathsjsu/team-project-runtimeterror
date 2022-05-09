package com.hmservice.hotel.pricingstrategy;


import java.util.Date;

public interface IPricingStrategy {
    public Double getPricingStrategy(Date date, float loyaltyPoints);
}

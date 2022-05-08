package com.hmservice.hotel.pricingstrategy;


import java.util.Date;

public class CustomerLoyaltyPricing implements IPricingStrategy{
    private final Double LOYALTYMULTIPLIER = 0.05;
    private final Double REGULARMULTIPLIER = 1.0;
    @Override
    public Double getPricingStrategy(Date date, float loyaltyPoint) {
        if (loyaltyPoint >=1000) {
            return 0.5;
        }

        if (loyaltyPoint >=100) {
            return LOYALTYMULTIPLIER * loyaltyPoint;
        }

        return REGULARMULTIPLIER;
    }
}

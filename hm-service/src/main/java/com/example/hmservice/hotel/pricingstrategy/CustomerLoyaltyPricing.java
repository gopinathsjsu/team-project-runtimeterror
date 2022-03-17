package com.example.hmservice.hotel.pricingstrategy;

import java.sql.Date;

public class CustomerLoyaltyPricing implements IPricingStrategy{
    private final Double LOYALTYMULTIPLIER = 0.5;
    private final Double REGULARMULTIPLIER = 1.0;
    @Override
    public Double getPricingStrategy(Date date, CustomerProfilePlaceholder customerProfile) {
        if (customerProfile == CustomerProfilePlaceholder.LOYALTY) {
            return LOYALTYMULTIPLIER;
        }

        return REGULARMULTIPLIER;
    }
}

package com.hmservice.hotel.pricingstrategy;

import java.util.Date;

public class NoStrategy implements IPricingStrategy {
    @Override
    public Double getPricingStrategy(Date date, float loyaltyPoint) {
        return 1.0;
    }
}

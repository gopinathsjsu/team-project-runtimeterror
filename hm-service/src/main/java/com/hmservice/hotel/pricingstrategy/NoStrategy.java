package com.hmservice.hotel.pricingstrategy;

import java.util.Date;

public class NoStrategy implements IPricingStrategy {
    @Override
    public Double getPricingStrategy(Date date, CustomerProfilePlaceholder customerProfile) {
        return 1.0;
    }
}

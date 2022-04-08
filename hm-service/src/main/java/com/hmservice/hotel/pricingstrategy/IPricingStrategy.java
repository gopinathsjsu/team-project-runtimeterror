package com.hmservice.hotel.pricingstrategy;

import java.sql.Date;

public interface IPricingStrategy {
    public Double getPricingStrategy(Date date, CustomerProfilePlaceholder customerProfile);
}

package com.hmservice.hotel.pricingstrategy;


import java.time.LocalDate;
import java.util.Date;

public class SeasonalPricing implements IPricingStrategy {
    private Date[] seasonalRange;
    private final Double SEASONALMULTIPLIER = 2.0;
    private final Double OUTOFSEASONMULTIPLIER = 1.0;

    public SeasonalPricing() {
        Date startDate = new Date("2022-06-01");
        Date endDate = new Date("2022-08-01");

        seasonalRange = new Date[2];
        seasonalRange[0] = startDate;
        seasonalRange[1] = endDate;
    }

    @Override
    public Double getPricingStrategy(Date date, float loyaltyPoint) {
        // During traveling season, hotel rates are 2x pricing
        if (date.compareTo(seasonalRange[0]) >= 0 && date.compareTo(seasonalRange[1]) <= 0){
            return SEASONALMULTIPLIER;
        }

        return OUTOFSEASONMULTIPLIER;
    }
}

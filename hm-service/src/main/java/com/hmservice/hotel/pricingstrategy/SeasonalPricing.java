package com.hmservice.hotel.pricingstrategy;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;

public class SeasonalPricing implements IPricingStrategy {
    private Date[] seasonalRange;
    private final Double SEASONALMULTIPLIER = 2.0;
    private final Double OUTOFSEASONMULTIPLIER = 1.0;

    public SeasonalPricing() {
        Date endDate = null;
        Date startDate = null;
        try {
            startDate = new SimpleDateFormat("yyyy-MM-dd").parse("2022-06-01");
            endDate = new SimpleDateFormat("yyyy-MM-dd").parse("2022-09-01");
        } catch (ParseException e) {
            e.printStackTrace();
        }
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

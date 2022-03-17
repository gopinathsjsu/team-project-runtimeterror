package com.example.hmservice.hotel.pricingstrategy;

import java.sql.Date;
import java.util.Calendar;
import java.util.HashSet;

public class DynamicPricing implements IPricingStrategy{
    private HashSet<Date> holidays;
    private final Double HOLIDAYMULTIPLIER = 2.0;
    private final Double WEEKDAYMULTIPLIER = 1.0;
    private final Double WEEKENDMULTIPLIER = 1.5;

    public DynamicPricing() {
        holidays = new HashSet<>();
        // hardcoded initialize holidays
        holidays.add(Date.valueOf("2022-01-01"));
        holidays.add(Date.valueOf("2022-01-17"));
        holidays.add(Date.valueOf("2022-02-21"));
        holidays.add(Date.valueOf("2022-05-30"));
        holidays.add(Date.valueOf("2022-06-19"));
        holidays.add(Date.valueOf("2022-06-20"));
        holidays.add(Date.valueOf("2022-07-04"));
        holidays.add(Date.valueOf("2022-09-05"));
        holidays.add(Date.valueOf("2022-10-10"));
        holidays.add(Date.valueOf("2022-11-11"));
        holidays.add(Date.valueOf("2022-11-24"));
        holidays.add(Date.valueOf("2022-12-25"));
        holidays.add(Date.valueOf("2022-12-26"));
    }

    @Override
    public Double getPricingStrategy(Date date, CustomerProfilePlaceholder customerProfile) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        int day = cal.get(Calendar.DAY_OF_WEEK);
        
        // if holiday
        if (holidays.contains(date)) {
            return HOLIDAYMULTIPLIER;
        }
        
        // if weekend
        if (day == Calendar.SATURDAY || day == Calendar.SUNDAY) {
            return WEEKENDMULTIPLIER;
        }

        // otherwise is weekday
        return WEEKDAYMULTIPLIER;
    }
}

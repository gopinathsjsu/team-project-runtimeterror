package com.hmservice.hotel.pricingstrategy;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;

public class DynamicPricing implements IPricingStrategy{
    private HashSet<String> holidays;
    private final Double HOLIDAYMULTIPLIER = 2.0;
    private final Double WEEKDAYMULTIPLIER = 1.0;
    private final Double WEEKENDMULTIPLIER = 1.5;

    public DynamicPricing() {
        holidays = new HashSet<>();
        // hardcoded initialize holidays
        holidays.add("01/01/2022");
        holidays.add("01/17/2022");
        holidays.add("02/21/2022");
        holidays.add("05/30/2022");
        holidays.add("06/19/2022");
        holidays.add("06/20/2022");
        holidays.add("07/04/2022");
        holidays.add("09/05/2022");
        holidays.add("10/10/2022");
        holidays.add("11/11/2022");
        holidays.add("11/24/2022");
        holidays.add("12/25/2022");
        holidays.add("12/26/2022");
    }

    @Override
    public Double getPricingStrategy(Date date, float loyaltyPoint) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);

        DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
        System.out.println(dateFormat.format(date));
        int day = cal.get(Calendar.DAY_OF_WEEK);

        // if holiday
        if (holidays.contains(dateFormat.format(date))) {
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

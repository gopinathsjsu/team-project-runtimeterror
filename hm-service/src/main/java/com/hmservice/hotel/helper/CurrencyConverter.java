package com.hmservice.hotel.helper;

import java.text.NumberFormat;
import java.util.Currency;
import java.util.Locale;

public class CurrencyConverter {
    public static String formatCurrency(Double amount) {
        Locale usa = new Locale("en", "US");
        Currency dollars = Currency.getInstance(usa);
        NumberFormat dollarFormat = NumberFormat.getCurrencyInstance(usa);
        return dollarFormat.format(amount);
    }
}

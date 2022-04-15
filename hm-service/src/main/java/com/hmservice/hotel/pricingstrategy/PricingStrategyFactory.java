package com.hmservice.hotel.pricingstrategy;


public class PricingStrategyFactory {
    public static IPricingStrategy GetStrategy(String shortcode) {
        return switch (shortcode) {
            case "DYN" -> new DynamicPricing();
            case "SEA" -> new SeasonalPricing();
            case "LOY" -> new CustomerLoyaltyPricing();
            default -> new NoStrategy();
        };
    }
}

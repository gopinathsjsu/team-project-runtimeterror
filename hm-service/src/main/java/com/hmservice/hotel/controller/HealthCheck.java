package com.hmservice.hotel.controller;

public class HealthCheck {
    private final int httpStatus;
    private final String check;

    public HealthCheck() {
        this.httpStatus = 200;
        this.check = "This service be working!!!";
    }

    public int getStatus() {
        return this.httpStatus;
    }
    public String getCheck() {
        return this.check;
    }
}

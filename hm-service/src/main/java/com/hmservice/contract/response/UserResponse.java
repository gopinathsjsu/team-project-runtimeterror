package com.hmservice.contract.response;

import java.util.List;

public class UserResponse {
    private Long id;
    private String username;
    private String email;
    private String phone;
    private Float loyalty;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Float getLoyalty() {
        return loyalty;
    }

    public void setLoyalty(Float loyalty) {
        this.loyalty = loyalty;
    }

    public UserResponse(Long id, String username, String email, String phone, Float loyalty) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.phone = phone;
        this.loyalty = loyalty;
    }
}

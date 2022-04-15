package com.hmservice.hotel.models;

import jdk.jfr.BooleanFlag;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Entity
@Table(name ="pricing_strategy")
public class PricingStrategy {

    @Id
    private Integer id;

    @NotBlank(message = "Strategy Name is mandatory")
    @Size(max = 20, message = "Strategy Name max length is {max}")
    @Column(name="name")
    private String strategyName;

    @NotBlank
    @Size(max = 4 , message = "Short code  max length is {max}")
    @Column(name="short_code")
    private String shortCode;

    @NotBlank
    @BooleanFlag
    @Column(name="enabled")
    private Boolean enabled;

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    public PricingStrategy() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStrategyName() {
        return strategyName;
    }

    public void setStrategyName(String strategyName) {
        this.strategyName = strategyName;
    }

    public String getShortCode() {
        return shortCode;
    }

    public void setShortCode(String shortCode) {
        this.shortCode = shortCode;
    }
}

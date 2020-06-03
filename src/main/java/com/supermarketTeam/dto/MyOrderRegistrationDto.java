package com.supermarketTeam.dto;

import javax.validation.constraints.NotEmpty;

public class MyOrderRegistrationDto {
    
    @NotEmpty
    private Double totalAmount;
    
     public Double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(Double totalAmount) {
        this.totalAmount = totalAmount;
    }
}

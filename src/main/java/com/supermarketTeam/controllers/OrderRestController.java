package com.supermarketTeam.controllers;

import com.supermarketTeam.entities.MyOrder;
import com.supermarketTeam.services.MyOrderServiceImpl;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/orderrest")
public class OrderRestController {
    
    public static final Logger logger = LoggerFactory.getLogger(OrderRestController.class);
    
    @Autowired
    private MyOrderServiceImpl serviceMyOrder;
    
    @GetMapping(value = "/", produces = "application/json")
    public List<MyOrder> listAllMyOrders() {
        return serviceMyOrder.listAll();
    }
}

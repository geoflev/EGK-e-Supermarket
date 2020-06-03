package com.supermarketTeam.controllers;

import com.supermarketTeam.entities.Address;
import com.supermarketTeam.entities.User;
import com.supermarketTeam.services.AddressServiceImpl;
import com.supermarketTeam.services.UserService;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller

public class UserAddressController {

    @Autowired
    private UserService userService;
    @Autowired
    private AddressServiceImpl service;

    @RequestMapping(value = "/useraddress/{email}", method = RequestMethod.GET)
    public String editUserAddress(ModelMap view, @PathVariable String email) {
        User user = userService.findByEmail(email);
        Address address = null;
        if (!user.getAddressList().isEmpty()) {
            address = user.getAddressList().get(0);
        }else {
            address = new Address();
        }
        view.addAttribute("address", address);
        view.addAttribute("user", user);
        return ("useraddress");
    }

    @RequestMapping(value = "/useraddress/{email}", method = RequestMethod.POST)
    public String updateUserAddress(@Valid Address address, BindingResult result, ModelMap view) {

        if (result.hasErrors()) {
            return "useraddress";
        }
        service.createOrUpdate(address);
        return ("redirect:/address/");
    }

}

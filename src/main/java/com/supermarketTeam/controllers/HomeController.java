package com.supermarketTeam.controllers;

import com.supermarketTeam.entities.Role;
import com.supermarketTeam.entities.User;
import com.supermarketTeam.services.UserServiceImpl;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    

    @RequestMapping("/")
    public String viewHomePage(Model model) {
        return "welcome";
    }
    
    @RequestMapping("/eshop")
    public String viewEShopPage(Model model, HttpServletRequest request) {
        return "productpage";
    
    }

}

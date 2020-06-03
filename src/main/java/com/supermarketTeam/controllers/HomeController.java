
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
     @Autowired
    private UserServiceImpl userService;
   
    @RequestMapping("/")
    public String viewHomePage(Model model, HttpServletRequest request) {    
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetail = (UserDetails) auth.getPrincipal();
        User u = userService.findByUsername(userDetail.getUsername());
        request.getSession().setAttribute("userId", u.getId());
        Role role = u.getRoles().iterator().next();
        if(role.getName().equals("ROLE_ADMIN")){
            return "welcome"; 
        }
 
        return "redirect:/useraddress/"+u.getEmail();
    }
    
    
    
}

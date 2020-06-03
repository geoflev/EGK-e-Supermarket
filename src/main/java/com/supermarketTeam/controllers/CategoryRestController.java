package com.supermarketTeam.controllers;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import com.supermarketTeam.dto.CategoryRegistrationDto;
import com.supermarketTeam.entities.Category;
import com.supermarketTeam.services.CategoryServiceImpl;
import java.util.ArrayList;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RestController
@RequestMapping("/categoryrest")
public class CategoryRestController {

    public static final Logger logger = LoggerFactory.getLogger(CategoryRestController.class);

    @Autowired
    private CategoryServiceImpl serviceCategory;

    // /categoryrest/
    @GetMapping(value = "/", produces = "application/json")
    public List<Category> listAllCategories() {
        return serviceCategory.listAll();
    }

    //   /categoryrest/1
    @GetMapping(value = "/{id}", produces = "application/json")
    public Category listOneCategory(@PathVariable("id") int id) {

        Category category = serviceCategory.findById(id);
        return category;

    }
    
    @PostMapping(produces = "application/json", consumes = "application/json")
       public Category saveCategory (@RequestBody CategoryRegistrationDto registration) {
        return serviceCategory.save(registration);
    }
       

    @PutMapping(value = "/{id}", produces = "application/json", consumes = "application/json")
    public Category updateCategory(@PathVariable(value = "id") int id, @RequestBody CategoryRegistrationDto registration) {
      
        Category category = serviceCategory.findById(id);
        category.setCategoryName(registration.getCategoryName());
        return serviceCategory.update(category);
    }

    @DeleteMapping(value = "/{id}")
    public void deleteCategory(@PathVariable(value = "id") int id) {
        Category category = serviceCategory.findById(id);
        serviceCategory.delete(category);

    }

}

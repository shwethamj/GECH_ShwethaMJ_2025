package com.simplespringboot.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RestController;

@Controller  // Use @RestController instead of @Controller when we are returning the text else just controller
public class HomeController {		
    
    @GetMapping({"", "/"})
    public String home() {
        return "home";
    }
}

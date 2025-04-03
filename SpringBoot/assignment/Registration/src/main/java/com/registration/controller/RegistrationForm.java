package com.registration.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.registration.model.Registration;
import com.registration.service.RegistrationService;
import java.util.List;

@Controller
@RequestMapping("/registration")
public class RegistrationForm {
    
    @Autowired
    private RegistrationService service;

    @GetMapping("/register")
    public String showRegistration(Model model) {
        model.addAttribute("registration", new Registration());
        return "register";    
    }

    @PostMapping("/register")
    public String registerRegistration(@ModelAttribute Registration registration) {
        service.register(registration);
        return "redirect:/registration/list";
    }

    @GetMapping("/list")
    public String listUsers(Model model) {
        List<Registration> users = service.getAllRegistration();
        model.addAttribute("register", users);
        return "register-list";
    }

    // Edit User Form
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") long id, Model model) {
        Registration user = service.getRegistrationById(id);
        model.addAttribute("registration", user);
        return "register-edit"; // Redirect to an edit page
    }

    // Update User
    @PostMapping("/update/{id}")
    public String updateUser(@PathVariable("id") long id, @ModelAttribute Registration registration) {
        service.updateRegistration(id, registration);
        return "redirect:/registration/list";
    }

    // Delete User
    @GetMapping("/delete/{id}")
    public String deleteUser(@PathVariable("id") long id) {
        service.deleteRegistration(id);
        return "redirect:/registration/list";
    }
}

package com.example.dynamiccard.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.dynamiccard.demo.models.Profile;
import com.example.dynamiccard.demo.service.ProfileService;

@Controller
@RequestMapping("/profiles")
public class ProfileController {

    private final ProfileService profileService;

    public ProfileController(ProfileService profileService) {
        this.profileService = profileService;
    }

    // Load the profile form and existing profiles
    @GetMapping
    public String showForm(Model model) {
        model.addAttribute("profile", new Profile()); // for form binding
        model.addAttribute("profiles", profileService.getAllProfiles()); // to display all profiles
        return "profile_form"; // Thymeleaf template
    }

    // Save the profile
    @PostMapping
    public String submitForm(@ModelAttribute Profile profile) {
        profileService.saveProfile(profile);
        return "redirect:/profiles";
    }

    // Delete profile by ID
    @GetMapping("/delete/{id}")
    public String deleteProfile(@PathVariable Long id) {
        profileService.deleteProfileById(id);
        return "redirect:/profiles";
    }
}

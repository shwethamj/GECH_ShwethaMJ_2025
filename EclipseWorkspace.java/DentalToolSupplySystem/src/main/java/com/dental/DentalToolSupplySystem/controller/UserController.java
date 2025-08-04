package com.dental.DentalToolSupplySystem.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.security.Principal;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.dental.DentalToolSupplySystem.model.DentalTool;
import com.dental.DentalToolSupplySystem.repository.UserRepository;
import com.dental.DentalToolSupplySystem.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserRepository userRepository;
	private UserService userService;
	 
	 
	@GetMapping("/user/dashboard")
    public String userDashboard(Model model, Principal principal) {
        String email = principal.getName();
        DentalTool user = userRepository.findByEmail(email);

        model.addAttribute("username", user.getName());
        model.addAttribute("email", user.getEmail());

//        int totalOrders = orderService.countOrdersByUserId(user.getId());
//        model.addAttribute("totalOrders", totalOrders);
//
//        int cartCount = userService.countCartItems(user.getId());
//        model.addAttribute("cartCount", cartCount);
//
//        List<Order> recentOrders = orderService.getRecentOrders(user.getId());
//        model.addAttribute("recentOrders", recentOrders);

        return "user_dashboard";
    }
	
	@GetMapping("/user/profile")
	public String showUserProfile(Model model, Principal principal) {
	    String email = principal.getName();
	    DentalTool user = userRepository.findByEmail(email);
	    model.addAttribute("user", user);
	    return "user_profile";
	}

	@PostMapping("/user/profile/update")
	public String updateProfile(@ModelAttribute DentalTool user,
	                            @RequestParam("image") MultipartFile imageFile,
	                            Principal principal) throws IOException {

	    String email = principal.getName();
	    DentalTool existingUser = userRepository.findByEmail(email);

	    // Update fields
	    existingUser.setName(user.getName());
	    existingUser.setPhoneNumber(user.getPhoneNumber());
//	    existingUser.setAddress(user.getAddress());

	    // Handle image upload
	    if (!imageFile.isEmpty()) {
	        String fileName = UUID.randomUUID().toString() + "_" + imageFile.getOriginalFilename();
	        Path uploadPath = Paths.get("src/main/resources/static/images");

	        if (!Files.exists(uploadPath)) {
	            Files.createDirectories(uploadPath);
	        }

	        Path filePath = uploadPath.resolve(fileName);
	        Files.copy(imageFile.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

	        existingUser.setProfileImage(fileName); // Save file name to DB
	    }

	    userRepository.save(existingUser);
	    return "redirect:/user/profile";
	}


}

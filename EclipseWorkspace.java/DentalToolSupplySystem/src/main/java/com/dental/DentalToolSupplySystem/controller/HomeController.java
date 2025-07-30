package com.dental.DentalToolSupplySystem.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dental.DentalToolSupplySystem.dto.DentalToolDTO;
import com.dental.DentalToolSupplySystem.model.DentalTool;
import com.dental.DentalToolSupplySystem.service.DentalToolSevice;

import jakarta.servlet.http.HttpServletResponse;



@Controller
public class HomeController {
	
	private DentalToolSevice dentaltoolSevice;
	

	public HomeController(DentalToolSevice dentaltoolSevice) {
		super();
		this.dentaltoolSevice = dentaltoolSevice;
	}

	@GetMapping("/")
	public String home(HttpServletResponse response) {
		 response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		    response.setHeader("Pragma", "no-cache");
		    response.setHeader("Expires", "0");
		    return "index";
	}
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}

	@GetMapping("/logout")
	public String logout() {
		return "login";
	}

	
	@GetMapping("/register")
	public String register(Model model) {
		DentalToolDTO dentaltoolDTO = new DentalToolDTO();
		model.addAttribute("dentaltoolDTO",dentaltoolDTO);
		return "register";
	}
	
	@PostMapping("/register")
	public String register(@ModelAttribute DentalToolDTO dentaltoolDTO, RedirectAttributes redirectAttributes) {
	    dentaltoolDTO.setRole("ROLE_CUSTOMER");

	    System.out.println(dentaltoolDTO);
	    dentaltoolSevice.storeUser(dentaltoolDTO);
	    redirectAttributes.addFlashAttribute("success", "User saved successfully");
	    return "redirect:/login";
	}

	@GetMapping("/forgetpassword")
	public String forgetPassword() {
		return "forgetpassword";
	}
	
	@GetMapping("/about")
	public String  about() {
		return "about";
	}
	
	@GetMapping("/cart")
	public String  cart() {
		return "cart";
	}
	
	@GetMapping("/categories")
	public String categories(Model model, Principal principal) {
	    if (principal != null && principal.getName().equals("admin@gmail.com")) {
	        model.addAttribute("isAdmin", true);
	    }
	    return "categories";
	}

	
	@GetMapping("/checkouts")
	public String  checkouts() {
		return "checkouts";
	}
	
	@GetMapping("/contact")
	public String  contact() {
		return "contact";
	}
	
	@GetMapping("/products")
	public String  products() {
		return "products";
	}
	
	@GetMapping("/terms_conditions")
	public String  terms_conditions() {
		return "terms_conditions";
	}
	
	

}




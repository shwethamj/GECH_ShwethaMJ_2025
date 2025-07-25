package com.dental.DentalToolSupplySystem.controller;

import com.dental.DentalToolSupplySystem.dto.DentalToolDTO;
import com.dental.DentalToolSupplySystem.dto.InventoryDTO;
import com.dental.DentalToolSupplySystem.model.ActivityLog;
import com.dental.DentalToolSupplySystem.model.DentalTool;
import com.dental.DentalToolSupplySystem.model.Inventory;
import com.dental.DentalToolSupplySystem.service.ActivityLogService;
import com.dental.DentalToolSupplySystem.service.DentalToolSevice;
import com.dental.DentalToolSupplySystem.service.InventoryService;
import com.dental.DentalToolSupplySystem.service.UserService;

import jakarta.validation.Valid;

import com.dental.DentalToolSupplySystem.repository.DentalToolRepository;
import com.dental.DentalToolSupplySystem.repository.InventoryRepository;
import com.dental.DentalToolSupplySystem.repository.UserRepository;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class Admincontroller {

    private final DentalToolSevice dentalToolService;
    private final UserService userService;
    private final InventoryService inventoryService;
    
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private InventoryRepository inventoryRepository;
    @Autowired
    private ActivityLogService dashboardService;
    

	public Admincontroller(DentalToolSevice dentalToolService, UserService userService,
			InventoryService inventoryService) {
		super();
		this.dentalToolService = dentalToolService;
		this.userService = userService;
		this.inventoryService = inventoryService;
	}

	@GetMapping("/admin_dashboard")
    public String showDashboard(Model model,Principal principal) {	
		 String email = principal.getName();
		    DentalTool user = userRepository.findByEmail(email);
		    model.addAttribute("username", user.getName());
		    model.addAttribute("adminEmail", user.getEmail());
        long totalUsers = dashboardService.countTotalUsers();
        long totalInventory = dashboardService.countTotalInventoryItems();
        long totalCategories = dashboardService.countTotalCategories();
        List<ActivityLog> recentActivity = dashboardService.getRecentActivityLogs();
        model.addAttribute("totalUsers", totalUsers);
        model.addAttribute("totalInventory", totalInventory);
        model.addAttribute("totalCategories", totalCategories);
        model.addAttribute("recentActivity", recentActivity);
        return "admin_dashboard"; // name of your HTML file without extension
    }
	//for user
	@GetMapping("/Manageuser")
	public String manageUser(Model model) {
	    model.addAttribute("users", userService.getAllUser());
	    return "Manageuser"; // this matches Manageuser.html
	}

    

    @GetMapping("/users/add")
    public String showAddForm(Model model) {
        model.addAttribute("dentalTool", new DentalTool());
        return "add-user";
    }
    
    // Show add form
    @GetMapping("/add-user")
    public String addUserForm(Model model) {
        model.addAttribute("dentalToolDTO", new DentalToolDTO());
        return "add-user"; 
    }

    // Handle add form submission
    @PostMapping("/add-user")
    public String addUser(
            @Valid @ModelAttribute("dentalToolDTO") DentalToolDTO dentalDTO,
            BindingResult result,
            RedirectAttributes attributes ) {

        if (result.hasErrors()) {
            return "add-user";
        }
        userService.saveUser(dentalDTO);
        attributes.addFlashAttribute("success", "User added successfully.");
        return "redirect:/Manageuser";
    }
    
    // Delete user
    @GetMapping("/user-delete")
    public String deleteUser(@RequestParam Long id) {
        userService.deleteUser(id);
        return "redirect:/Manageuser";
    }

    
 // Show edit form
    @GetMapping("/edit-user")
    public String editUser(@RequestParam Long id, Model model) {
        DentalToolDTO dentalDTO = userService.editUser(id);
        DentalTool dental = userRepository.findById(id).get();
        model.addAttribute("dentalDTO",dentalDTO);
        model.addAttribute("dental",dental);
        return "edit-user";
        
    }

    // Handle update submission
    @PostMapping("/update-user")
	public String updateUser(@Valid @ModelAttribute DentalToolDTO dentalDTO, BindingResult result, @RequestParam Long id, Model model) {
		DentalTool user  = userRepository.findByEmail(dentalDTO.getEmail());
		if(user!=null && user.getId()!=id) {
			result.addError(new FieldError("DentalToolDTO", "email", "Email is already exists"));
		}
		if(result.hasErrors()) {
			model.addAttribute("dentalDTO", dentalDTO);
			DentalTool user1 = userRepository.findById(id).get();
			model.addAttribute("dental", user1);
			return "edit-user";
		}
		userService.updateUser(dentalDTO,id);
		
		
        return "redirect:/Manageuser";
    }

    
    // for inventory
    
    @GetMapping("/admin_inventory")
	public String admininventory(Model model) {
	    model.addAttribute("inventory", inventoryService.getAllinventory());
	    return "admin_inventory"; // this matches Manageuser.html
	}
    
    
    @GetMapping("/add-inventory")
    public String addInventory(Model model) {
        model.addAttribute("inventoryDTO", new InventoryDTO());
        return "add-inventory"; 
    }


    @PostMapping("/add-inventory")
    public String addInventory(
            @Valid @ModelAttribute("inventoryDTO") InventoryDTO inventoryDTO,
            BindingResult result,
            RedirectAttributes attributes ) {

        if (result.hasErrors()) {
            return "add-inventory";
        }

        inventoryService.saveInventory(inventoryDTO);
        attributes.addFlashAttribute("success", "User added successfully.");
        return "redirect:/admin_inventory";
    }
    
    @GetMapping("/inventory-delete")
    public String deleteInventory(@RequestParam Long id) {
        inventoryService.deleteInventory(id);
        return "redirect:/admin_inventory";
    }
    
    @GetMapping("/edit-inventory")
    public String editInventory(@RequestParam Long id, Model model) {
        InventoryDTO inventoryDTO = inventoryService.editInventory(id);
		Inventory inventory = inventoryRepository.findById(id).get();
        model.addAttribute("inventoryDTO",inventoryDTO);
        model.addAttribute("inventory",inventory);
        return "edit-inventory";
        
    }
    
    @PostMapping("/update-inventory")
    public String updateInventory(
            @Valid @ModelAttribute("inventoryDTO") InventoryDTO inventoryDTO,
            BindingResult result,
            @RequestParam Long id,
            Model model) {

        if (result.hasErrors()) {
            model.addAttribute("inventory", inventoryRepository.findById(id).get()); // ✅ Correct variable name);
            return "edit-inventory";
        }

        inventoryService.updateInventory(inventoryDTO, id); // ✅ Pass id separately
        return "redirect:/admin_inventory";
    }

   
    
    //role
    @PostMapping("/changeRole")
    public String changeUserRole(@RequestParam Long id, @RequestParam String role, RedirectAttributes redirectAttributes) {
        Optional<DentalTool> optionalUser = userRepository.findById(id);
        if (optionalUser.isPresent()) {
            DentalTool user = optionalUser.get();
            user.setRole(role);
            userRepository.save(user);
            redirectAttributes.addFlashAttribute("message", "Role updated successfully!");
        } else {
            redirectAttributes.addFlashAttribute("error", "User not found!");
        }
        return "redirect:/Manageuser";
    }
    
    @GetMapping("/users")
    public List<DentalTool> searchUsers(@RequestParam("keyword") String keyword) {
        return userRepository.findByNameContainingIgnoreCaseOrEmailContainingIgnoreCase(keyword, keyword);
    }



 
}

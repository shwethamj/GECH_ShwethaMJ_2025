package com.example.DBRelationEmployee.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.DBRelationEmployee.DTO.TaskDTO;
import com.example.DBRelationEmployee.model.Employee;
import com.example.DBRelationEmployee.repository.EmployeeRepository;
import com.example.DBRelationEmployee.service.EmployeeService;
import com.example.DBRelationEmployee.service.TaskService;

import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/task")
public class TaskController {

    @Autowired
    private TaskService taskService;
    @Autowired
    private EmployeeRepository employeeRepository;

    @Autowired
    private EmployeeService userService;

    // Show tasks for current user
    @GetMapping("/my")
    public String myTasks(Model model, Principal principal) {
        Employee user = userService.findByEmail(principal.getName());
        List<TaskDTO> tasks = taskService.getTasksByEmployeeId(user.getId());
        model.addAttribute("tasks", tasks);
        return "user_tasks"; // Create this view
    }

    
    @GetMapping("/dashboard")
    public String userDashboard(Model model, Principal principal) {
        Employee user = userService.findByEmail(principal.getName());
        List<TaskDTO> tasks = taskService.getTasksByEmployeeId(user.getId());

        model.addAttribute("user", user);
        model.addAttribute("tasks", tasks);

        return "user-dashboard";
    }
    
//    @GetMapping("/profile")
//    public String showProfile(Model model) {
//        Employee user = userService.getCurrentUser(); // Just example logic
//        model.addAttribute("user", user); // ✅ REQUIRED for profile.html
//        return "profile";
//    }

  
    //for admin dashboard task access
    @GetMapping("")
    public String showAllTasks(Model model) {
        List<TaskDTO> tasks = taskService.getAllTasks(); // You must implement this in your service
        model.addAttribute("tasks", tasks);
        return "task"; // This maps to `task.html` (your admin dashboard task view)
    }
    
    
    @GetMapping("/add")
    public String showAddTaskForm(Model model) {
        model.addAttribute("task", new TaskDTO());
        model.addAttribute("employees", employeeRepository.findAll());
        return "add-task"; // View: add-task.html
    }

    @PostMapping("/save")
    public String saveTask(@ModelAttribute TaskDTO taskDTO) {
        taskService.saveTask(taskDTO);
        return "redirect:/task"; // Redirect to all tasks
    }

    @GetMapping("/edit/{id}")
    public String editTaskForm(@PathVariable Long id, Model model) {
        TaskDTO task = taskService.getTaskById(id);
        model.addAttribute("task", task);
        model.addAttribute("employees", employeeRepository.findAll());
        return "edit-task";
    }

    @PostMapping("/update")
    public String updateTask(@ModelAttribute TaskDTO taskDTO) {
        taskService.updateTask(taskDTO);
        return "redirect:/task";
    }
    
    @GetMapping("/delete/{id}")
    public String deleteTask(@PathVariable Long id) {
        taskService.deleteTaskById(id);  // This method should be in your TaskService
        return "redirect:/task";  // redirect to task list after deletion
    }



}

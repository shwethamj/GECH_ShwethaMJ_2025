package emp_crud.EMPCRUD.controller;


import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import emp_crud.EMPCRUD.service.EmployeeService;
import emp_crud.EMPCRUD.dto.EmployeeDto;
import emp_crud.EMPCRUD.models.Employee;

@Controller

public class EmployeeController {
	
	
		private final EmployeeService employeeService;
		

		public EmployeeController(EmployeeService employeeService) {
			super();
			this.employeeService = employeeService;
		}


		@GetMapping({"","/"})
		public String getAllEmployees(Model model) {
			List<Employee>employee=employeeService.getAllEmployees();
			model.addAttribute("employees",employee);
			return "Employee";
		}
		@GetMapping("/addEmployee")
		public String addEmployee(Model model) {
			EmployeeDto employeeDto=new EmployeeDto();
			model.addAttribute("studentDto",employeeDto);
			return "addEmployee";
		}
		
		@PostMapping("/addEmployee")
		public String saveEmployee(@ModelAttribute EmployeeDto employeeDto) {
			employeeService.saveEmployee(employeeDto);
			return "redirect:/";
		}
		
		@GetMapping("/edit-Employee")
		public String getEmployee(@RequestParam Long id,Model model) {
			Employee employee =employeeService.getEmployee(id);
			EmployeeDto employeeDto = new EmployeeDto();
			employeeDto.setFname(employee.getFname());
			employeeDto.setLname(employee.getLname());
			employeeDto.setEmail(employee.getEmail());
			employeeDto.setPhone(employee.getPhone());
			employeeDto.setAddress(employee.getAddress());
			model.addAttribute("studentDto",employeeDto); // form fields
			model.addAttribute("employee",employee); // for id
			return "edit-employee";
		}
		@PostMapping("/edit-employee")
		public String updateEmployee(@ModelAttribute EmployeeDto employeeDto, @RequestParam Long id) {
			employeeService.updateEmployee(employeeDto, id);
			return "redirect:/";
		}
		
		@GetMapping("/delete")
		public String deleteStudent(@RequestParam Long id) {
			employeeService.deleteEmployee(id);
			return "redirect:/";
		}
		
		

	


}

package emp_crud.EMPCRUD.service;

import org.springframework.stereotype.Service;
import emp_crud.EMPCRUD.dto.EmployeeDto;

import emp_crud.EMPCRUD.models.Employee;
import emp_crud.EMPCRUD.repository.EmployeeRepository;

import java.util.List;


@Service

public class EmployeeService {

	private final EmployeeRepository employeeRepository; //field ingestion

	public EmployeeService(EmployeeRepository employeeRepository) { //constructor ingestion
		super();
		this.employeeRepository = employeeRepository;
	}
	//to get list of stydents
	public List<Employee>getAllEmployees(){
		List<Employee> employees =employeeRepository.findAll();
		
		// list is a more than one data list<student> means list of student
		return employees;
}
	public void saveEmployee(EmployeeDto employeeDto) {
		Employee employee = new Employee();
		employee.setFname(employeeDto.getFname());
		employee.setLname(employeeDto.getLname());
		employee.setEmail(employeeDto.getEmail());
		employee.setPhone(employeeDto.getPhone());
		employee.setAddress(employeeDto.getAddress());
		employeeRepository.save(employee);
	}
	
	public Employee getEmployee(Long id) {
		Employee employee= employeeRepository.findById(id).get();
		return employee;
	}
	public void updateEmployee(EmployeeDto employeeDto,Long id) {
		Employee employee =employeeRepository.findById(id).get();
		employee.setFname(employeeDto.getFname());
		employee.setLname(employeeDto.getLname());
		employee.setEmail(employeeDto.getEmail());
		employee.setPhone(employeeDto.getPhone());
		employee.setAddress(employeeDto.getAddress());
		employeeRepository.save(employee);
	}
	public void deleteEmployee(Long id) {
		// TODO Auto-generated method stub
		employeeRepository.deleteById(id);
		
	}
	
	
	
	
	
}

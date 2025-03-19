package emp_crud.EMPCRUD.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import emp_crud.EMPCRUD.models.Employee;



public interface EmployeeRepository extends JpaRepository<Employee,Long> {
	
	

	
}

package com.example.DBRelationEmployee.service;

import java.util.HashSet;
import java.util.List;

import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.DBRelationEmployee.DTO.EmployeeDTO;
import com.example.DBRelationEmployee.model.Address;
import com.example.DBRelationEmployee.model.Department;
import com.example.DBRelationEmployee.model.Employee;
import com.example.DBRelationEmployee.model.Roles;
import com.example.DBRelationEmployee.repository.AddressRepository;
import com.example.DBRelationEmployee.repository.DepartmentRepository;
import com.example.DBRelationEmployee.repository.EmployeeRepository;
import com.example.DBRelationEmployee.repository.RolesRepository;

@Service
public class EmployeeService {

    private final PasswordEncoder passwordEncoder;
    private final EmployeeRepository employeeRepository;
    private final RolesRepository rolesRepository;
    private final DepartmentRepository departmentRepository;
    private final AddressRepository addressRepository;

    public EmployeeService(
            PasswordEncoder passwordEncoder,
            EmployeeRepository employeeRepository,
            RolesRepository rolesRepository,
            DepartmentRepository departmentRepository,
            AddressRepository addressRepository) {
        this.passwordEncoder = passwordEncoder;
        this.employeeRepository = employeeRepository;
        this.rolesRepository = rolesRepository;
        this.departmentRepository = departmentRepository;
        this.addressRepository = addressRepository;
    }

    public void saveEmployee(EmployeeDTO employeeDTO) {
        Employee employee = new Employee();
        employee.setName(employeeDTO.getName());
        employee.setEmail(employeeDTO.getEmail());
        employee.setPassword(passwordEncoder.encode(employeeDTO.getPassword()));

        // Set Address
        Address address = new Address();
        address.setAddress(employeeDTO.getAddress());
        address.setEmployee(employee);
        employee.setAddress(address);

        // Set Roles
        if (employeeDTO.getRoles().isEmpty()) {
            Roles defaultRole = rolesRepository.findByRolename("USER")
                    .orElseThrow(() -> new RuntimeException("Default role not found"));
            employee.getRoles().add(defaultRole);
        } else {
            List<Roles> roles = rolesRepository.findAllById(employeeDTO.getRoles());
            employee.setRoles(new HashSet<>(roles));
        }

        // Set Department
        if (employeeDTO.getDepartmentId() != null) {
            Department dept = departmentRepository.findById(employeeDTO.getDepartmentId())
                    .orElseThrow(() -> new RuntimeException("Department not found"));
            employee.setDepartment(dept);
        }

        employeeRepository.save(employee);
    }

    public void updateEmployee(EmployeeDTO employeeDTO, Long id) {
        Employee employee = employeeRepository.findById(id)
                .orElseThrow(() -> new UsernameNotFoundException("Employee not found"));

        employee.setName(employeeDTO.getName());
        employee.setEmail(employeeDTO.getEmail());

        if (!employeeDTO.getPassword().isEmpty()) {
            employee.setPassword(passwordEncoder.encode(employeeDTO.getPassword()));
        }

        // Update or create Address
        Address address = employee.getAddress();
        if (address == null) {
            address = new Address();
        }
        address.setAddress(employeeDTO.getAddress());
        address.setEmployee(employee);
        employee.setAddress(address);

        // Update Roles
        List<Roles> roles = rolesRepository.findAllById(employeeDTO.getRoles());
        employee.setRoles(new HashSet<>(roles));

        // Update Department
        if (employeeDTO.getDepartmentId() != null) {
            Department dept = departmentRepository.findById(employeeDTO.getDepartmentId())
                    .orElseThrow(() -> new RuntimeException("Department not found"));
            employee.setDepartment(dept);
        }

        employeeRepository.save(employee);
    }
    
    public void deleteEmployee(Long id) {
        Employee employee = employeeRepository.findById(id)
                .orElseThrow(() -> new UsernameNotFoundException("Employee not found"));

        // Optional cleanup: detach from roles
        for (Roles role : employee.getRoles()) {
            role.getEmployee().remove(employee);
        }

        // Optional cleanup: remove address reference
        if (employee.getAddress() != null) {
            employee.setAddress(null);
        }

        employeeRepository.delete(employee);
    }

}

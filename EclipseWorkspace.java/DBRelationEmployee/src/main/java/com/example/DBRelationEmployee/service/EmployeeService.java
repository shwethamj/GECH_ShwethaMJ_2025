package com.example.DBRelationEmployee.service;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

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
    private final EmployeeRepository userRepository;
    private final RolesRepository roleRepository;
    private final DepartmentRepository departmentRepository;
    private final AddressRepository addressRepository;

    public EmployeeService(
            PasswordEncoder passwordEncoder,
            EmployeeRepository userRepository,
            RolesRepository roleRepository,
            DepartmentRepository departmentRepository,
            AddressRepository addressRepository
    ) {
        this.passwordEncoder = passwordEncoder;
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.departmentRepository = departmentRepository;
        this.addressRepository = addressRepository;
    }

    public void saveUser(EmployeeDTO userDTO) {
        Employee user = new Employee();
        user.setName(userDTO.getName());
        user.setEmail(userDTO.getEmail());
        user.setPassword(passwordEncoder.encode(userDTO.getPassword()));

     // 🛠️ Address logic (clean + reuse if exists)
        String submittedAddress = userDTO.getAddress().trim();
        Address addressToUse = addressRepository.findAll().stream()
                .filter(a -> a.getAddress().equalsIgnoreCase(submittedAddress))
                .findFirst()
                .orElseGet(() -> {
                    Address newAddress = new Address();
                    newAddress.setAddress(submittedAddress);
                    return addressRepository.save(newAddress);
                });
        user.setAddress(addressToUse);



        // ✅ Department
        if (userDTO.getDepartmentId() != null) {
            Department department = departmentRepository.findById(userDTO.getDepartmentId())
                    .orElseThrow(() -> new RuntimeException("Department not found"));
            user.setDepartment(department);
        }

        // ✅ Roles (with fallback)
        Set<Roles> userRoles;
        if (userDTO.getRoles() != null && !userDTO.getRoles().isEmpty()) {
            userRoles = new HashSet<>(roleRepository.findAllById(userDTO.getRoles()));
        } else {
            Roles defaultRole = roleRepository.findByRolename("USER")
                    .orElseThrow(() -> new RuntimeException("Default role 'USER' not found"));
            userRoles = new HashSet<>();
            userRoles.add(defaultRole);
        }
        user.setRoles(userRoles);

        userRepository.save(user);
    }
    
    
    public void updateUser(EmployeeDTO userDTO, Long id) {
        Employee user = userRepository.findById(id)
                .orElseThrow(() -> new UsernameNotFoundException("User not found"));

        // Basic info
        user.setName(userDTO.getName());
        user.setEmail(userDTO.getEmail());

        if (userDTO.getPassword() != null && !userDTO.getPassword().isEmpty()) {
            user.setPassword(passwordEncoder.encode(userDTO.getPassword()));
        }

        // ✅ Address (shared allowed with ManyToOne)
        if (userDTO.getAddress() != null && !userDTO.getAddress().trim().isEmpty()) {
            String submittedAddress = userDTO.getAddress().trim();

            Address addressToUse = addressRepository.findAll().stream()
                    .filter(a -> a.getAddress().equalsIgnoreCase(submittedAddress))
                    .findFirst()
                    .orElseGet(() -> {
                        Address newAddress = new Address();
                        newAddress.setAddress(submittedAddress);
                        return addressRepository.save(newAddress);
                    });

            user.setAddress(addressToUse);
        }

        // ✅ Department
        if (userDTO.getDepartmentId() != null) {
            Department department = departmentRepository.findById(userDTO.getDepartmentId())
                    .orElseThrow(() -> new RuntimeException("Department not found"));
            user.setDepartment(department);
        }

        // ✅ Roles
        Set<Roles> roles = new HashSet<>(roleRepository.findAllById(userDTO.getRoles()));
        user.setRoles(roles);

        // ✅ Save user
        userRepository.save(user);
    }


    // ✅ Clean any "__other__," prefix from custom address input
    private String cleanAddress(String rawAddress) {
        if (rawAddress == null) return "";
        return rawAddress.replace("__other__,", "").trim();
    }

    // For login/task use
    public Employee findByEmail(String email) {
        return userRepository.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("User not found"));
    }
    
    //for count
    public long getUserCount() {
        return userRepository.count(); // more efficient than findAll().size()
    }
    
    //to dislpy user
    public List<Employee> getAllUsers() {
        return userRepository.findAll(); // Or userRepository.findAll();
    }



}

package com.example.DBRelationEmployee.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.DBRelationEmployee.DTO.TaskDTO;
import com.example.DBRelationEmployee.model.Employee;
import com.example.DBRelationEmployee.model.Task;
import com.example.DBRelationEmployee.repository.EmployeeRepository;
import com.example.DBRelationEmployee.repository.TaskRepository;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class TaskService {

    @Autowired
    private TaskRepository taskRepository;

    @Autowired
    private EmployeeRepository employeeRepository;

    
    //for add
    public void saveTask(TaskDTO dto) {
        Task task = new Task();
        task.setTitle(dto.getTitle());
        task.setDeadline(dto.getDeadline());
        task.setStatus(dto.getStatus());

        Employee employee = employeeRepository.findById(dto.getEmployeeId())
                .orElseThrow(() -> new RuntimeException("Employee not found"));
        task.setEmployee(employee);

        taskRepository.save(task);
    }

    //for edit 
    public TaskDTO getTaskById(Long id) {
        Task task = taskRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Task not found"));

        TaskDTO dto = new TaskDTO();
        dto.setId(task.getId());
        dto.setTitle(task.getTitle());
        dto.setDeadline(task.getDeadline());
        dto.setStatus(task.getStatus());
        dto.setEmployeeId(task.getEmployee().getId());

        return dto;
    }

    //for update
    public void updateTask(TaskDTO dto) {
        Task task = taskRepository.findById(dto.getId())
                .orElseThrow(() -> new RuntimeException("Task not found"));

        task.setTitle(dto.getTitle());
        task.setDeadline(dto.getDeadline());
        task.setStatus(dto.getStatus());

        Employee employee = employeeRepository.findById(dto.getEmployeeId())
                .orElseThrow(() -> new RuntimeException("Employee not found"));

        task.setEmployee(employee);
        taskRepository.save(task);
    }

    //for delete
    public void deleteTaskById(Long id) {
		taskRepository.deleteById(id);
		
	}
    
    
    public List<TaskDTO> getTasksByEmployeeId(Long employeeId) {
        return taskRepository.findByEmployeeId(employeeId)
                .stream()
                .map(task -> {
                    TaskDTO dto = new TaskDTO();
                    dto.setId(task.getId());
                    dto.setTitle(task.getTitle());
                    dto.setDeadline(task.getDeadline());
                    dto.setStatus(task.getStatus());
                    dto.setEmployeeId(task.getEmployee().getId());
                    return dto;
                })
                .collect(Collectors.toList());
    }
    
    
    //for list task for admin
    public List<TaskDTO> getAllTasks() {
        return taskRepository.findAll()
                .stream()
                .map(task -> {
                    TaskDTO dto = new TaskDTO();
                    dto.setId(task.getId());
                    dto.setTitle(task.getTitle());
                    dto.setDeadline(task.getDeadline());
                    dto.setStatus(task.getStatus());
                    dto.setEmployeeId(task.getEmployee().getId());
                    dto.setEmployee(task.getEmployee()); // So you can access employee.name in the view
                    return dto;
                })
                .collect(Collectors.toList());
    }

	
}

package com.example.DBRelationEmployee.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.DBRelationEmployee.model.Roles;

public interface RolesRepository  extends JpaRepository<Roles, Long>{
	Optional<Roles> findByRolename(String rolename);

}
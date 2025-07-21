package com.example.DBRelationEmployee.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.DBRelationEmployee.model.Roles;

@Repository
public interface RolesRepository  extends JpaRepository<Roles, Long>{
	Optional<Roles> findByRolename(String rolename);

}
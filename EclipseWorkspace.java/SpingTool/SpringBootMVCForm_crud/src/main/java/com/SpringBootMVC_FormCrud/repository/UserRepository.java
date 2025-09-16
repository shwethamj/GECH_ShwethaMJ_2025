package com.SpringBootMVC_FormCrud.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.SpringBootMVC_FormCrud.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

}

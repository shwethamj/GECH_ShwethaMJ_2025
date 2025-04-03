package com.registration.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.registration.model.Registration;

public interface RegistrationRepository extends JpaRepository<Registration, Long> {
}
package com.example.dynamiccard.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.dynamiccard.demo.models.Profile;

public interface ProfileRepository extends JpaRepository<Profile, Long> {
}

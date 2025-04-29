package com.example.dynamiccard.demo.service;

import java.util.List;

import com.example.dynamiccard.demo.models.Profile;



public interface ProfileService {
    Profile saveProfile(Profile profile);
    List<Profile> getAllProfiles();
    void deleteProfileById(Long id);
}


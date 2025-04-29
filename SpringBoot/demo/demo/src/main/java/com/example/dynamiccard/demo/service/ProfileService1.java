package com.example.dynamiccard.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.dynamiccard.demo.models.Profile;
import com.example.dynamiccard.demo.repository.ProfileRepository;

@Service
public class ProfileService1 implements ProfileService {

    private final ProfileRepository profileRepository;

    public ProfileService1(ProfileRepository profileRepository) {
        this.profileRepository = profileRepository;
    }

    @Override
    public Profile saveProfile(Profile profile) {
        return profileRepository.save(profile);
    }

    @Override
    public List<Profile> getAllProfiles() {
        return profileRepository.findAll();
    }

    @Override
    public void deleteProfileById(Long id) {
        profileRepository.deleteById(id);
    }
}

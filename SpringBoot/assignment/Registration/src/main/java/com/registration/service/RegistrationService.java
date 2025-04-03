package com.registration.service;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.registration.model.Registration;
import com.registration.repository.RegistrationRepository;

@Service
public class RegistrationService {
    
    @Autowired
    private RegistrationRepository registrationRepository;

    public Registration register(Registration registration) {
        return registrationRepository.save(registration);
    }

    public List<Registration> getAllRegistration(){
        return registrationRepository.findAll();
    }

    public Registration getRegistrationById(long id) {
        Optional<Registration> user = registrationRepository.findById(id);
        return user.orElse(null);
    }

    public void updateRegistration(long id, Registration updatedUser) {
        Registration existingUser = getRegistrationById(id);
        if (existingUser != null) {
            existingUser.setName(updatedUser.getName());
            existingUser.setEmail(updatedUser.getEmail());
            existingUser.setPhone(updatedUser.getPhone());
            existingUser.setCity(updatedUser.getCity());
            existingUser.setGender(updatedUser.getGender());
            existingUser.setSkill(updatedUser.getSkill());
            existingUser.setAddress(updatedUser.getAddress());
            registrationRepository.save(existingUser);
        }
    }

    public void deleteRegistration(long id) {
        registrationRepository.deleteById(id);
    }
}

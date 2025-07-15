package com.dental.DentalToolSupplySystem.service;

import java.util.List;

import org.springframework.stereotype.Service;


import com.dental.DentalToolSupplySystem.dto.DentalToolDTO;
import com.dental.DentalToolSupplySystem.model.DentalTool;
import com.dental.DentalToolSupplySystem.repository.DentalToolRepository;
import com.dental.DentalToolSupplySystem.repository.InventoryRepository;
import com.dental.DentalToolSupplySystem.repository.UserRepository;

@Service
public class UserService {

		private DentalToolRepository dentalRepository;
		private UserRepository userRepository;
		
		


		public UserService(DentalToolRepository dentalRepository, UserRepository userRepository) {
			super();
			this.dentalRepository = dentalRepository;
			this.userRepository = userRepository;
		}


		public List<DentalTool> getAllUser() {
			List<DentalTool> users =  userRepository.findAll();
			return users;
		}
		

		public void saveUser(DentalToolDTO dentalDTO) {
			
			DentalTool user = new DentalTool();
			user.setName(dentalDTO.getName());
			user.setEmail(dentalDTO.getEmail());
			user.setPassword(dentalDTO.getPassword());
			user.setRole(dentalDTO.getRole());
	
			userRepository.save(user);
		}

		public void deleteUser(Long id) {
			DentalTool user =  userRepository.findById(id).get();
			//what is the image path of the student
			userRepository.delete(user);
		}

		public DentalToolDTO editUser(Long id) {
			DentalTool user =  userRepository.findById(id).get();
			DentalToolDTO dentalDTO = new DentalToolDTO();
			dentalDTO.setName(user.getName());
			dentalDTO.setEmail(user.getEmail());
			dentalDTO.setPassword(user.getPassword());
			dentalDTO.setRole(user.getRole());
			return dentalDTO;
		}

		public void updateUser(DentalToolDTO dentalDTO, Long id) {
			DentalTool user =  userRepository.findById(id).get();
			user.setName(dentalDTO.getName());			
			user.setEmail(dentalDTO.getEmail());
			user.setPassword(dentalDTO.getPassword());
			user.setRole(dentalDTO.getRole());
			userRepository.save(user);
		}

	}


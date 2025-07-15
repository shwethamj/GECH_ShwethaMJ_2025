package com.dental.DentalToolSupplySystem.service;

import java.util.List;
import java.util.Optional;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.dental.DentalToolSupplySystem.dto.DentalToolDTO;
import com.dental.DentalToolSupplySystem.model.DentalTool;
import com.dental.DentalToolSupplySystem.repository.DentalToolRepository;


@Service
public class DentalToolSevice {

		private DentalToolRepository dentaltoolRepository;
		private PasswordEncoder passwordEncoder;
		
		public DentalToolSevice(DentalToolRepository dentaltoolRepository, PasswordEncoder passwordEncoder) {
			super();
			this.dentaltoolRepository = dentaltoolRepository;
			this.passwordEncoder = passwordEncoder;
		}
		
		public void storeUser(DentalToolDTO dentaltoolDTO)
		{
			DentalTool dental = new DentalTool();

			dental.setName(dentaltoolDTO.getName());
			dental.setEmail(dentaltoolDTO.getEmail());
			System.out.println(dentaltoolDTO.getPassword());
			dental.setPassword(passwordEncoder.encode(dentaltoolDTO.getPassword()));
			dental.setRole("ROLE_CUSTOMER");
		  dentaltoolRepository.save(dental);
		  
		}
		
		 public static Object getAllUsers() {
				// TODO Auto-generated method stub
				return null;
			}

		 
		 
}
		

		
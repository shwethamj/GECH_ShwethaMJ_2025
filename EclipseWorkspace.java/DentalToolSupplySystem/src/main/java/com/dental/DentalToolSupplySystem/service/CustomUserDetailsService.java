
package com.dental.DentalToolSupplySystem.service;


import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.dental.DentalToolSupplySystem.service.CustomUserDetails;
import com.dental.DentalToolSupplySystem.model.DentalTool;
import com.dental.DentalToolSupplySystem.repository.DentalToolRepository;

public class CustomUserDetailsService implements UserDetailsService {
	
	private DentalToolRepository dentaltoolRepository;

	public CustomUserDetailsService(DentalToolRepository dentaltoolRepository) {
		super();
		this.dentaltoolRepository = dentaltoolRepository;
	}

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		 DentalTool dental = dentaltoolRepository.findByEmail(email)
				.orElseThrow(
						()->new UsernameNotFoundException("username not found "+email)
						);

		 return new CustomUserDetails(dental);
	}
	
	
}
	

	
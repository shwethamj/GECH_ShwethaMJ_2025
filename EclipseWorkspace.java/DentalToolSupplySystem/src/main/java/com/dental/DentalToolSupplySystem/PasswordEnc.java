package com.dental.DentalToolSupplySystem;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordEnc {
	public static void main(String[]args) {
		System.out.println(new BCryptPasswordEncoder().encode("1234"));
	}
}
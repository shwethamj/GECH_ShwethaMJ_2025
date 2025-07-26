package com.example.DBRelationEmployee;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PassEnc {

	public static void main(String[]args) {
		System.out.println(new BCryptPasswordEncoder().encode("123"));
	}
}

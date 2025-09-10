package com.SpringBoot_Dependency3;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component
public class NetBank implements PaymentService {

	@Override
	public void paymentType() {
		System.out.println("netbank1 payment type");
		
	}

	
}

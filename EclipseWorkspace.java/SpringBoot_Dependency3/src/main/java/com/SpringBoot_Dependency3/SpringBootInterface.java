package com.SpringBoot_Dependency3;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component
public class SpringBootInterface {

	//field injection  in interface dependency
	@Autowired
	@Qualifier("netBank")
	private PaymentService paymentService;

	public SpringBootInterface() {
		System.out.println("SpringBootInterface object created");
	}
	
	
	@Qualifier("netBankingPaymentService")
	public PaymentService getPaymentService() {
		return paymentService;
	}


	public void setPaymentService(PaymentService paymentService) {
		this.paymentService = paymentService;
	}
	

}

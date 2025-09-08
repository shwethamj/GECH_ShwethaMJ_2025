package com.SpringBoot_Dependency3;

import org.springframework.stereotype.Component;

@Component
public class NetBankingPaymentService implements PaymentService {

	public NetBankingPaymentService() {
		System.out.println("netbanking object created ");
	}
	
	@Override
	public void paymentType() {
		System.out.println("netBanking Payment type ");
	}
}

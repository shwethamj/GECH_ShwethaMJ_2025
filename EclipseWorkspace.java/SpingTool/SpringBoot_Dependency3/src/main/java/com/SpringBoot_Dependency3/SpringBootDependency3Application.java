package com.SpringBoot_Dependency3;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;

@SpringBootApplication
public class SpringBootDependency3Application {

	public static void main(String[] args) {
		ConfigurableApplicationContext run =  SpringApplication.run(SpringBootDependency3Application.class, args);

		
	SpringBootInterface bean = run.getBean(SpringBootInterface.class);
	System.out.println(bean.getPaymentService());
	bean.getPaymentService().paymentType();//netbank1 payment type // same as NetBank ->bcs i set qualifier to netBank interface
	
	NetBankingPaymentService bean2  = (NetBankingPaymentService)run.getBean("netBankingPaymentService");
	System.out.println(bean2);
	bean2.paymentType();//netBanking Payment type
	
	NetBank bean3  = (NetBank)run.getBean("netBank");
	System.out.println(bean3);
	bean3.paymentType(); //netbank1 payment type
	
	
	
	
	
	/*
	 * if one interface and one class is there --> then the class override method will take 
	 
	 * if i have one interface and multiple class(whose implements same inteface and ovverided the mthod of interface in all)
		-->	if we call method(paymentType) using interface then  -->RE cause
		--> so we need to use 	@Qualifier("netBankingPaymentService") at springBootInterface(interface)
		-->then it will take the value present in method (paymentType -->which we overrided in netBankingPaymentService and not takes the netbank)

	 */
	}

}

package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;

import com.example.demo.hello.student1;

import hello.Student;

@SpringBootApplication
public class DemoApplication {

    private final SpringBootConf springBootConf;

    private final Customer customer1;

    DemoApplication(Customer customer1, SpringBootConf springBootConf) {
        this.customer1 = customer1;
        this.springBootConf = springBootConf;
    }

	public static void main(String[] args) {

		ConfigurableApplicationContext run = SpringApplication.run(DemoApplication.class, args);
		Object bean = run.getBean("customer1"); //passing a bean object
		Customer c1 = (Customer)bean;//type casting was done access only object(like c1) within  Customer1 not  bean object(customer1)
		System.out.println(c1); 
		System.out.println(c1.name);
	

		Customer customer2 = (Customer) run.getBean("customer2");
		System.out.println(customer2);
		
		Customer customer3 = (Customer) run.getBean("customer3");
		System.out.println(customer3);
		
		Car car =(Car) run.getBean("car1");
		//car.name = "mahendra";
		System.out.println(car.name);
		System.out.println(car.model);
		
		//Student std = (Student) run.getBean("std"); //we cannot create this bcs it  not in base pacakge
		
		student1 std1 = (student1)run.getBean("std1"); // can be done bcs its in base package
		
		/*
		//if we want typecasting done directly --> use Customer.class
		
		Customer bean2 =  run.getBean(Customer.class);//it works only when ioc contsiner have only one bean per particular class
		System.out.println(bean2);
		
		//it will give runtime exception bcs -> for customer class we have 3object so -->NoUniqueBeanDefinitionException --> expected single matching bean but found 3
	
		 */
		
	}

}

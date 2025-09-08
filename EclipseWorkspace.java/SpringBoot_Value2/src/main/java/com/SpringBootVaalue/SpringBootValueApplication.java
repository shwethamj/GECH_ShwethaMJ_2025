package com.SpringBootVaalue;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;


@SpringBootApplication
public class SpringBootValueApplication {

	public static void main(String[] args) {

		ConfigurableApplicationContext run =	SpringApplication.run(SpringBootValueApplication.class, args);
			
		Student student = (Student)run.getBean("student");
		Address address = (Address)run.getBean("address");

		//constructor
		System.out.println(student);
		
	System.out.println("roll no : "+student.roll);
	System.out.println("marks of std :  "+student.marks);
		
		/*
		 * Why @Autowired is used here in constructor or method near?

				@Autowired tells Spring: “This method should be called during dependency injection.”
				
				Normally, Spring injects beans into @Autowired methods.
				
				But if you also put @Value on the parameter, Spring resolves the property value and injects it when calling the method.
				
				So here’s the flow:
				
				Spring creates your bean.
				
				It finds the method setName(...) marked with @Autowired.
				
				It sees the parameter has @Value("${student.name}").
				
				It loads student.name from your application.properties / application.yml.
				
				It calls setName(value).
				
				Without @Autowired, Spring won’t even call this setter method during bean initialization. That’s why your name stayed null.
		 */
		
	}

}

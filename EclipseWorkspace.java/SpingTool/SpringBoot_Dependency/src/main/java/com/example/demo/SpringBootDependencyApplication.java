package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;

@SpringBootApplication
public class SpringBootDependencyApplication {

    private final SpingBootConfig spingBootConfig;

    private final Employee employee;

    SpringBootDependencyApplication(Employee employee, SpingBootConfig spingBootConfig) {
        this.employee = employee;
        this.spingBootConfig = spingBootConfig;
    }

	public static void main(String[] args) {
		ConfigurableApplicationContext run = SpringApplication.run(SpringBootDependencyApplication.class, args);
	
		Employee emp = (Employee)run.getBean("employee");
		
		
		Address add =(Address)run.getBean("address");
		Address address1  = (Address)run.getBean("address1");
		Address address2 = (Address)run.getBean("address2");
		
		System.out.println("employee:" +emp); //hashcode
		System.out.println("address :"+add);//hashcode
		System.out.println("addrees1 : "+address1);
		System.out.println("addrees2  : "+address2);
		
		emp.e_name="shetha";
		add.a_name ="banglore";
		
		System.out.println("-------------------------------------------");
		address1.a_name ="mysore";
		System.out.println("from employee adreesss : "+emp.addressOne); //hashcode similar to address1
		System.out.println("from employee address name: "+emp.addressOne.a_name);
			
		
		
	/* 
	 * if we multiple object for address class employee will consider the
	  	naming convention one (which object name similar to instance variable in employee)
	  
	 QUALIFIER:
	 ============
	 * if the instance variable in employee not matched any address --> cause RE
	  	--> so to overcome that we can use @Qualifier ==>need use this with @autowired
	  	 	and pass the object name(which obj  of address need to use) in employee class
	  	--> ex : @qualifier(addrres1) @autowired ==>it will take object address1
	 
	PRIMARY:
	=========
	When you have multiple beans of the same type, Spring will not know which one to inject.
	If you mark one with @Primary, that bean becomes the default choice for injection.
	
	*/
	}

}

package dev.mvc.rent_oracle_project;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"dev.mvc"})
public class RentOracleProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(RentOracleProjectApplication.class, args);
	}

}

package org.kogg.customer;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = {"org.kogg.common","org.kogg.customer"})
public class CustomApp {

    public static void main(String[] args) {
        SpringApplication.run(CustomApp.class,args);
    }
}

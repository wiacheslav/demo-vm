package com.example.demovm;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
public class DemoVmApplication {

    public static void main(String[] args) {
        SpringApplication.run(DemoVmApplication.class, args);
    }

    @RestController()
    static class HelloController {
        @GetMapping(path = "hello")
        public String hello() {
            return "Hello World!";
        }
    }
}

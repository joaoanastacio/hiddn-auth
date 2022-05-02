package com.hiddn.authenticator;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path = "/v1/auth")
public class AuthController {

    private AuthController() {
        // Create to disable external access using default constructor
    }

    @GetMapping(path = "/hello")
    public static String helloWorld() {
        return "Hello World";
    }
    
}

package com.egirra.jdatahomework3.controller;

import com.egirra.jdatahomework3.repository.Repository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController("/products/fetch-product")
public class Controller {
    Repository repository;

    public Controller(Repository repository) {
        this.repository = repository;
    }

    @GetMapping("/products/fetch-product")
    public String getProduct(@RequestParam(name = "name") String name) {
        return repository.getProductName(name);
    }
}
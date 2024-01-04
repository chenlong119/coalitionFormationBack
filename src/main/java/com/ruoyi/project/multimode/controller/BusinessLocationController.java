package com.ruoyi.project.multimode.controller;

import com.ruoyi.project.multimode.domain.BusinessLocation;
import com.ruoyi.project.multimode.service.BusinessLocationService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

@RestController
@RequestMapping("/businessLocations")
public class BusinessLocationController {

    private final BusinessLocationService businessLocationService;

    public BusinessLocationController(BusinessLocationService businessLocationService) {
        this.businessLocationService = businessLocationService;
    }

    @GetMapping("/getDatalist")
    public List<BusinessLocation> getAllBusinessLocations() {
        return businessLocationService.findAll();
    }
}


package com.ruoyi.project.multimode.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;
import com.ruoyi.project.multimode.domain.BusinessDirection;
import com.ruoyi.project.multimode.service.BusinessDirectionService;

@RestController
@RequestMapping("/businessDirection")
public class BusinessDirectionController {

    private final BusinessDirectionService businessDirectionService;

    public BusinessDirectionController(BusinessDirectionService businessDirectionService) {
        this.businessDirectionService = businessDirectionService;
    }

    @GetMapping("/getDatalist")
    public List<BusinessDirection> getAllBusinessDirections() {
        return businessDirectionService.findAll();
    }
}

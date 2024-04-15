package com.ruoyi.project.multimode.controller;

import com.ruoyi.project.multimode.domain.CoalitionDetails;
import com.ruoyi.project.multimode.service.CoalitionService; // 确保这里使用正确的Service接口
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/coalition")
public class CoalitionController {

    private final CoalitionService coalitionService;

    @Autowired
    public CoalitionController(CoalitionService coalitionService) {
        this.coalitionService = coalitionService;
    }

    @GetMapping("/details")
    public List<CoalitionDetails> getCoalitionDetails() {
        return coalitionService.selectCoalitionDetails();
    }
}

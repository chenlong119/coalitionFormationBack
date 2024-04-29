package com.ruoyi.project.coalitionformation.controller;

import com.ruoyi.project.coalitionformation.entity.Resource;
import com.ruoyi.project.coalitionformation.service.CoalitionTaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/coalition")
public class CoalitionTaskController {
    @Autowired
    private CoalitionTaskService coalitionTaskService;

    @PostMapping("/allocation")
    public Integer allocate(Integer taskId, @RequestBody List<Resource> resourceList)
    {
        return coalitionTaskService.allocate(taskId, resourceList);
    }
}

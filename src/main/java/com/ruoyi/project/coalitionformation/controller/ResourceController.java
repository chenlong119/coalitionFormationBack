package com.ruoyi.project.coalitionformation.controller;

import com.ruoyi.project.coalitionformation.entity.Resource;
import com.ruoyi.project.coalitionformation.service.ResourceService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/resource")
public class ResourceController {

  @Autowired ResourceService resourceService;

  @GetMapping("/getCompanyResource")
  public List<Resource> getCompanyResource(Integer companyId, Integer layerId) {
    return resourceService.getCompanyResource(companyId, layerId);
  }

  @GetMapping("/getTaskResource")
  public List<Resource> getTaskResource(Integer task_id) {
    return resourceService.getTaskResource(task_id);
  }
}

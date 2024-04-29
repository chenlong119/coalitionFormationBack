package com.ruoyi.project.coalitionformation.controller;

import com.ruoyi.project.coalitionformation.entity.Resource;
import com.ruoyi.project.coalitionformation.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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

  @GetMapping("/getone")
  public Resource getone(Integer id) {
    return resourceService.getone(id);
  }

  @PutMapping("/updateTaskResource")
  public void updateTaskResource(
      @RequestParam Integer taskId, @RequestBody List<Resource> resources) {
    resourceService.updateTaskResource(taskId, resources);
  }

  @PutMapping("/updateCompanyResource")
  public void updateCompanyResource(
      @RequestParam Integer companyId,
      @RequestParam Integer layerId,
      @RequestBody List<Resource> resources) {
    resourceService.updateCompanyResource(companyId, layerId, resources);
  }

  @DeleteMapping("/deleteTaskResource")
  public void deleteTaskResource(@RequestParam Integer taskId, String resources) {
    String[] resource_ids_str = resources.split(",");
    for (String resource_id : resource_ids_str) {
      resourceService.deleteTaskResource(taskId, Integer.valueOf(resource_id));
    }
  }

  @DeleteMapping("/deleteCompanyResource")
  public void deleteCompanyResource(Integer companyId, Integer layerId, String resources) {
    String[] resource_ids_str = resources.split(",");
    for (String resource_id : resource_ids_str) {
      resourceService.deleteCompanyResource(companyId, layerId, Integer.valueOf(resource_id));
    }
  }

  @PostMapping("/insertTaskResource")
  public void addTaskResource(Integer taskId, @RequestBody List<Resource> resources) {
    for (Resource resource : resources) resourceService.insertTaskResource(taskId, resource);
  }

  @PostMapping("/insertCompanyResource")
  public void addCompanyResource(
      @RequestParam Integer companyId,
      @RequestParam Integer layerId,
      @RequestBody List<Resource> resources) {
    for (Resource resource : resources)
      resourceService.insertCompanyResource(companyId, layerId, resource);
  }
}

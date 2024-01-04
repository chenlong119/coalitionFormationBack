package com.ruoyi.project.multimode.controller;

import com.ruoyi.project.multimode.domain.Business2;
import com.ruoyi.project.multimode.service.WorkshopSchedulingService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/genetic-algorithm")
public class WorkshopSchedulingController {
  @Autowired private WorkshopSchedulingService workshopSchedulingService;

  @GetMapping("/run")
  public String runAlgorithm() {
    return workshopSchedulingService.runAlgorithm();
  }

  @GetMapping("/getFaultyMachinesInfo")
  public ResponseEntity<List<String>> getFaultyMachinesInfo() {
    List<String> errorMachinesInfo = workshopSchedulingService.getErrorMachinesInfo();
    return ResponseEntity.ok(errorMachinesInfo);
  }

  @GetMapping("/getFaultyMachines")
  public ResponseEntity<List<String>> getFaultyMachines() {
    List<String> errorMachines = workshopSchedulingService.getErrorMachines();
    return ResponseEntity.ok(errorMachines);
  }

  @GetMapping("/getMachinesForJob/{jobId}")
  public List<Integer> getMachinesForJob(@PathVariable int jobId) {
    return workshopSchedulingService.getMachinesForJob(jobId);
  }

  @GetMapping("/dataList")
  public String getDataList() {
    return workshopSchedulingService.getDataListInfo();
  }

  @GetMapping("/getBusinessName/{businessName}")
  public Business2 getBusinessByName(@PathVariable String businessName) {
    return workshopSchedulingService.getBusinessName(businessName);
  }

  @PostMapping("/getBusinessNamesByIds")
  public Map<Integer, String> getBusinessNamesByIds(@RequestBody List<Integer> businessIds) {
    return workshopSchedulingService.getBusinessNamesByIds(businessIds);
  }

  @GetMapping("/tasks-cross-info")
  public ResponseEntity<Map<Integer, String>> getTasksCrossInfo() {
    Map<Integer, String> tasksCrossInfo = workshopSchedulingService.getTasksCrossInfo();
    return ResponseEntity.ok(tasksCrossInfo);
  }

  @GetMapping("/getBusinessNameById/{businessId}")
  public ResponseEntity<String> getBusinessNameById(@PathVariable String businessId) {

    String businessName = workshopSchedulingService.getBusinessNameById(businessId);
    return ResponseEntity.ok(businessName);
  }
}

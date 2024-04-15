package com.ruoyi.project.multimode.controller;

import com.ruoyi.project.multimode.domain.PartOneCollection;
import com.ruoyi.project.multimode.service.WorkshopSchedulingService;
import java.util.List;

import com.ruoyi.project.multimode.domain.TaskAll2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/genetic-algorithm")
public class WorkshopSchedulingController {
  @Autowired private WorkshopSchedulingService workshopSchedulingService;

  @GetMapping("/run")
  public ResponseEntity<List<PartOneCollection>> runAlgorithm() {
    List<PartOneCollection> result = workshopSchedulingService.runAlgorithm();
    //System.out.println("Returning result: " + result); // 或者使用日志框架记录
    return ResponseEntity.ok(result); // 返回结果，Spring Boot会自动将其转换为JSON
  }
  //展示当前正常的任务状态
  @GetMapping("/activetask")
  public List<TaskAll2> getActiveTasks() {
    return workshopSchedulingService.selectActiveTasks();
  }
}

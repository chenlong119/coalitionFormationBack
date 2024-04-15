package com.ruoyi.project.multig.controller;

import com.ruoyi.project.multig.domain.TaskCompanyInfo;
import com.ruoyi.project.multig.service.TaskCompanyInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
@RestController
@RequestMapping("/api/taskCompanyInfo")
public class TaskCompanyInfoController {

    private static final Logger log = LoggerFactory.getLogger(TaskCompanyInfoController.class);

    private final TaskCompanyInfoService taskCompanyInfoService;

    @Autowired
    public TaskCompanyInfoController(TaskCompanyInfoService taskCompanyInfoService) {
        this.taskCompanyInfoService = taskCompanyInfoService;
    }

    @GetMapping
    public ResponseEntity<TaskCompanyInfo> getTaskCompanyInfo(@RequestParam Long taskId, @RequestParam Long companyId) {
        log.info("Received request for TaskCompanyInfo with taskId: {} and companyId: {}", taskId, companyId);


        TaskCompanyInfo info = taskCompanyInfoService.getTaskCompanyInfo(taskId, companyId);
        log.info("信息查看: {} ", info);
        if (info != null) {
            log.info("Found TaskCompanyInfo with expectedQuantity: {} and expectedDeliveryTime: {}", info.getExpectedQuantity(), info.getExpectedDeliveryTime());
            return ResponseEntity.ok(info);
        } else {
            log.warn("No TaskCompanyInfo found for taskId: {} and companyId: {}", taskId, companyId);
            return ResponseEntity.notFound().build();
        }
    }

}


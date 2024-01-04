package com.ruoyi.project.multimode.controller;

import com.ruoyi.project.multimode.service.TasklistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/getTask")
public class TasklistController {
    @Autowired
    private TasklistService taskService;
    private static final Logger logger = LoggerFactory.getLogger(TasklistController.class);
    @GetMapping("/getTaskNameById/{taskId}")
    public ResponseEntity<String> getTaskNameById(@PathVariable("taskId") Integer taskId) {
        logger.info("Received request to get task name for taskId: {}", taskId);
        try {
            String taskName = taskService.getTaskNameById(taskId);
            return ResponseEntity.ok(taskName);
        } catch (Exception e) {
            logger.error("Error in getTaskNameById for taskId: {}", taskId, e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
}

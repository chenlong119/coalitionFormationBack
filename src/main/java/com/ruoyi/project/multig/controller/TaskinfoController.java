package com.ruoyi.project.multig.controller;

import com.ruoyi.project.multig.domain.MutigTask;
import com.ruoyi.project.multig.service.TaskService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class TaskinfoController {

    private final TaskService taskService;
    private static final Logger logger = LoggerFactory.getLogger(TaskinfoController.class);

    @Autowired
    public TaskinfoController(TaskService taskService) {
        this.taskService = taskService;
    }

    // 新增的搜索任务端点
    @GetMapping("/tasks")
    public ResponseEntity<List<MutigTask>> selectAllTasks() {
        List<MutigTask> searchedTasks = taskService.selectAllTasks();
        logger.info("Searched tasks for current user: {}", searchedTasks);
        return ResponseEntity.ok(searchedTasks);
    }
}

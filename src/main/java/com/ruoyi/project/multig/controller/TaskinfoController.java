package com.ruoyi.project.multig.controller;

import com.ruoyi.project.multig.domain.MutigTask;
import com.ruoyi.project.multig.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;


// TaskinfoController.java
import org.slf4j.Logger;
        import org.slf4j.LoggerFactory;

@RestController
@RequestMapping("/api/tasks")
public class TaskinfoController {
    private final TaskService taskService;

    @Autowired
    public TaskinfoController(TaskService taskService) {
        this.taskService = taskService;
    }
    private static final Logger logger = LoggerFactory.getLogger(TaskinfoController.class);

    // ... 省略其他代码 ...

    @GetMapping
    public ResponseEntity<List<MutigTask>> getAllTasks() {

        List<MutigTask> tasks = taskService.getAllTasks();
        logger.info("Retrieved tasks: {}", tasks);
        return ResponseEntity.ok(tasks);
    }

    // ... 省略其他代码 ...
}

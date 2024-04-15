package com.ruoyi.project.multimode.controller;
import com.ruoyi.project.multimode.domain.SubtaskResult;
import com.ruoyi.project.multimode.service.TaskBreakdownService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
@RestController
@RequestMapping("/taskbreakdown")
public class TaskBreakdownController {
    @Autowired
    private TaskBreakdownService taskbreakdownService;

    @GetMapping("/subtaskResults")
    public List<SubtaskResult> getSubtaskResults() {
        return taskbreakdownService.calculateSubtaskResults();
    }
}

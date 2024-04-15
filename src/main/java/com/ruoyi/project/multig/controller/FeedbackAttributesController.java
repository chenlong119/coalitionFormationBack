package com.ruoyi.project.multig.controller;

import com.ruoyi.project.multig.service.FeedbackAttributesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/api/history")
public class FeedbackAttributesController {

    @Autowired
    private FeedbackAttributesService feedbackAttributesService;

    @GetMapping("/calculate/{taskId}")
    public ResponseEntity<Map<String, FeedbackAttributesService.SemanticPair[][]>> calculateAndFetchHistory(@PathVariable int taskId) {
        try {
            Map<String, FeedbackAttributesService.SemanticPair[][]> matrices = feedbackAttributesService.createMatrixByTaskId(taskId);
            return ResponseEntity.ok(matrices);
        } catch (Exception e) {
            e.printStackTrace(); // This will help in debugging if something goes wrong
            return ResponseEntity.internalServerError().build(); // Optionally, provide a more specific error message
        }
    }
}

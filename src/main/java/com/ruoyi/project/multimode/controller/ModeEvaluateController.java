package com.ruoyi.project.multimode.controller;

import com.ruoyi.project.multimode.domain.ModeEvaluate;
import com.ruoyi.project.multimode.service.ModeEvaluateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/modeEvaluate")
public class ModeEvaluateController {
    @Autowired
    private ModeEvaluateService modeEvaluateService;

    @GetMapping("/getAllModes")
    public ResponseEntity<List<ModeEvaluate>> getAllModes() {
        List<ModeEvaluate> modes = modeEvaluateService.getAllModes();
        return ResponseEntity.ok(modes);
    }
    @GetMapping("/getCompletionRate/{modeName}")
    public ResponseEntity<String> getCompletionRate(@PathVariable String modeName) {
        String completionRate = modeEvaluateService.findCompletionRateByModeName(modeName);
        return ResponseEntity.ok(completionRate);
    }

    // 获取特定模式的故障发生率
    @GetMapping("/getFailureRate/{modeName}")
    public ResponseEntity<String> getFailureRate(@PathVariable String modeName) {
        String failureRate = modeEvaluateService.findFailureRateByModeName(modeName);
        return ResponseEntity.ok(failureRate);
    }

    @GetMapping("/getAllModesSorted")
    public ResponseEntity<List<ModeEvaluate>> getAllModesSorted() {
        List<ModeEvaluate> modes = modeEvaluateService.getAllModesSortedByCompletionRate();
        return ResponseEntity.ok(modes);
    }

}
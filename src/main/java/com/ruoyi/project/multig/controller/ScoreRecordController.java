package com.ruoyi.project.multig.controller;


import com.ruoyi.project.multig.domain.ScoreRecord;
import com.ruoyi.project.multig.service.ScoreRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/scoresave")
public class ScoreRecordController {

    @Autowired
    private ScoreRecordService scoreRecordService;

    @PostMapping("/submit")
    public void submitScore(@RequestBody ScoreRecord scoreRecord) {
        scoreRecordService.saveScoreRecord(scoreRecord);
    }
    @GetMapping("/history")
    public List<ScoreRecord> getScoreHistory() {
        return scoreRecordService.getScoreHistory();
    }
}

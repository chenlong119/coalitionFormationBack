package com.ruoyi.project.multig.controller;


import com.ruoyi.project.multig.domain.ScoreRecord;
import com.ruoyi.project.multig.service.ScoreRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController("ScoreRecord")
@RequestMapping("/api/scoresave")
public class ScoreRecordController {

    @Autowired
    private ScoreRecordService scoreRecordService;

    @PostMapping("/submit")
    public Integer submitScoreRecord(@RequestBody ScoreRecord scoreRecord) {

          Integer res=  scoreRecordService.saveScoreRecord(scoreRecord); // 向第一个表存储数据
            scoreRecordService.insertRelationRecord(scoreRecord); // 向第二个表存储数据
        return res;
    }
    @GetMapping("/history")
    public List<ScoreRecord> selectScoreHistory() {
        return scoreRecordService.selectScoreHistory();
    }


}

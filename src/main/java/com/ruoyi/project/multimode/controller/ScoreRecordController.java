package com.ruoyi.project.multimode.controller;

import com.ruoyi.project.multimode.domain.ScoreDetail;
import com.ruoyi.project.multimode.domain.ScoreRecord2;
import com.ruoyi.project.multimode.service.ScoreRecordService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


@RestController
@RequestMapping("/scoreRecords")
public class ScoreRecordController {
    private static final Logger logger = LoggerFactory.getLogger(ScoreRecordController.class);

    @Autowired
    private ScoreRecordService scoreRecordService;

    @GetMapping("/{id}")
    public ResponseEntity<ScoreRecord2> getScoreRecordById(@PathVariable Integer id) {
        ScoreRecord2 record = scoreRecordService.getScoreRecordById(id);
        return ResponseEntity.ok(record);
    }

    @GetMapping("/all")
    public ResponseEntity<List<ScoreRecord2>> getAllScoreRecords() {
        List<ScoreRecord2> records = scoreRecordService.getAllScoreRecords();
        logger.info("Fetched Score Records: {}", records);
        return ResponseEntity.ok(records);
    }
    @GetMapping("/all/details")
    public ResponseEntity<List<ScoreDetail>> getAllScoreDetails() {
        List<ScoreDetail> details = scoreRecordService.getAllScoreDetails();
        logger.info("Fetched Score Details: {}", details);
        return ResponseEntity.ok(details);
    }
}
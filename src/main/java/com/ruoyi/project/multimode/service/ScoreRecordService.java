package com.ruoyi.project.multimode.service;

import com.ruoyi.project.multimode.domain.ScoreDetail;
import com.ruoyi.project.multimode.domain.ScoreRecord2;

import java.util.List;

public interface ScoreRecordService {
    ScoreRecord2 getScoreRecordById(Integer id);
    List<ScoreRecord2> getAllScoreRecords();
    List<ScoreDetail> getAllScoreDetails();
}

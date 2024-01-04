package com.ruoyi.project.multig.service;

import com.ruoyi.project.multig.domain.ScoreRecord;
import com.ruoyi.project.multig.mapper.ScoreRecordMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ScoreRecordService {
    @Autowired
    private ScoreRecordMapper scoreRecordMapper;

    public void saveScoreRecord(ScoreRecord scoreRecord) {
        scoreRecordMapper.insertScoreRecord(scoreRecord);
    }
    public List<ScoreRecord> getScoreHistory() {
        return scoreRecordMapper.selectScoreHistory();
    }

}
package com.ruoyi.project.multimode.service.impl;

import com.ruoyi.project.multimode.domain.ScoreDetail;
import com.ruoyi.project.multimode.domain.ScoreRecord2;
import com.ruoyi.project.multimode.mapper.ScoreRecordMapper;
import com.ruoyi.project.multimode.service.ScoreRecordService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ScoreRecordServiceImpl implements ScoreRecordService {
    @Resource(name="scoreRecordMapper2")
    private ScoreRecordMapper scoreRecordMapper;

    @Override
    public ScoreRecord2 getScoreRecordById(Integer id) {
        return scoreRecordMapper.selectById(id);
    }

    @Override
    public List<ScoreRecord2> getAllScoreRecords() {
        System.out.println("Calling getAllScoreRecords");
        List<ScoreRecord2> records = scoreRecordMapper.selectAll();
        System.out.println("Fetched all score records: " + records);
        return records;
    }
    @Override
    public List<ScoreDetail> getAllScoreDetails() {
        return scoreRecordMapper.selectAllWithDetails();
    }

}

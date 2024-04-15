package com.ruoyi.project.multig.service;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.project.multig.domain.ScoreRecord;
import com.ruoyi.project.multig.mapper.ScoreRecordMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ScoreRecordService {

    @Autowired
    private ScoreRecordMapper scoreRecordMapper;

    public Integer saveScoreRecord(ScoreRecord scoreRecord) {
        // 获取当前用户的 ID
        Long userId = SecurityUtils.getUserId();

        // 将 userId 设置为 scoreRecord 的 userId
        scoreRecord.setCompanyId(userId.intValue());

        // 保存 scoreRecord
        scoreRecordMapper.insertScoreRecord(scoreRecord);
        scoreRecordMapper.insertRelationRecord(scoreRecord);
        return scoreRecord.getId();
    }

    public List<ScoreRecord> selectScoreHistory() {
        int userId = SecurityUtils.getUserId().intValue();

        return scoreRecordMapper.selectScoreHistory(userId);
    }

    public void insertRelationRecord(ScoreRecord scoreRecord) {
    }

    // 其他方法...

}

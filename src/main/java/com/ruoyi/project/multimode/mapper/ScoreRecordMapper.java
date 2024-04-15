package com.ruoyi.project.multimode.mapper;

import com.ruoyi.project.multimode.domain.ScoreDetail;
import com.ruoyi.project.multimode.domain.ScoreRecord2;
import org.springframework.stereotype.Component;

import java.util.List;

@Component("scoreRecordMapper2")
public interface ScoreRecordMapper {
    ScoreRecord2 selectById(Integer id);
    List<ScoreRecord2> selectAll();
    List<ScoreDetail> selectAllWithDetails();
}

package com.ruoyi.project.multimode.mapper;

import com.ruoyi.project.multimode.domain.ModeEvaluate;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ModeEvaluateMapper {
    List<ModeEvaluate> findAll();
    String findCompletionRateByModeName(String modeName);

    // 查询特定模式的故障发生率
    String findFailureRateByModeName(String modeName);
    List<ModeEvaluate> findAllSortedByCompletionRate();
}

package com.ruoyi.project.multimode.service;

import com.ruoyi.project.multimode.domain.ModeEvaluate;

import java.util.List;

public interface ModeEvaluateService {
    List<ModeEvaluate> getAllModes();
    String findCompletionRateByModeName(String modeName);

    // 新方法，查询特定模式的故障发生率
    String findFailureRateByModeName(String modeName);
    List<ModeEvaluate> getAllModesSortedByCompletionRate();

}
package com.ruoyi.project.multimode.service.impl;

import com.ruoyi.project.multimode.domain.ModeEvaluate;
import com.ruoyi.project.multimode.mapper.ModeEvaluateMapper;
import com.ruoyi.project.multimode.service.ModeEvaluateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ModeEvaluateServiceImpl implements ModeEvaluateService {
    @Autowired
    private ModeEvaluateMapper modeEvaluateMapper;

    @Override
    public List<ModeEvaluate> getAllModes() {
        return modeEvaluateMapper.findAll();
    }

    @Override
    public String findCompletionRateByModeName(String modeName) {
        return modeEvaluateMapper.findCompletionRateByModeName(modeName);
    }

    @Override
    public String findFailureRateByModeName(String modeName) {
        return modeEvaluateMapper.findFailureRateByModeName(modeName);
    }

    @Override
    public List<ModeEvaluate> getAllModesSortedByCompletionRate() {
        return modeEvaluateMapper.findAllSortedByCompletionRate();
    }


}

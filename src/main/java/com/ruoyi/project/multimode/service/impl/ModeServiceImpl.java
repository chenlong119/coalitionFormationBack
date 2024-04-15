package com.ruoyi.project.multimode.service.impl;

import com.ruoyi.project.multimode.service.ModeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.multimode.mapper.ModeMapper;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.project.multimode.domain.Mode;
import java.util.List;

@Service
public
class ModeServiceImpl implements ModeService {

    @Autowired
    private ModeMapper modeMapper;
    @Override
    public List<Mode> getAllModes() {
        return modeMapper.selectAllModes();
    }

    @Override
    @Transactional
    public void incrementCompetitionRate(Integer modeId) {
        modeMapper.updateCompetitionRateById(modeId);
    }
}


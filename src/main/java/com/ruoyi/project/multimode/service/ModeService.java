package com.ruoyi.project.multimode.service;

import com.ruoyi.project.multimode.domain.Mode;

import java.util.List;

public interface ModeService {
    List<Mode> getAllModes();
    void incrementCompetitionRate(Integer modeId);
}

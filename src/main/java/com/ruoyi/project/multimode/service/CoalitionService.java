package com.ruoyi.project.multimode.service;

import com.ruoyi.project.multimode.domain.Coalition;
import com.ruoyi.project.multimode.domain.CoalitionDetails;
import io.lettuce.core.dynamic.annotation.Param;

import java.util.List;
import java.util.Map;

public interface CoalitionService {
    List<CoalitionDetails> selectCoalitionDetails();
    List<CoalitionDetails> searchCoalitionByCriteria(@Param("coalitionId") Integer coalitionId,
                                                     @Param("taskId") Integer taskId,
                                                     @Param("coalitionName") String coalitionName,
                                                     @Param("modeName") String modeName);
}

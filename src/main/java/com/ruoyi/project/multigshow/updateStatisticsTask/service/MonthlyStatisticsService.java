package com.ruoyi.project.multigshow.updateStatisticsTask.service;

import com.ruoyi.project.multigshow.updateStatisticsTask.domain.MonthlyStatistics;
import com.ruoyi.project.multigshow.updateStatisticsTask.mapper.MonthlyStatisticsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class MonthlyStatisticsService {

    @Autowired
    private MonthlyStatisticsMapper statisticsMapper;

    public List<MonthlyStatistics> getAllMonthlyStatistics() {
        return statisticsMapper.selectAllMonthlyStatistics();
    }
}

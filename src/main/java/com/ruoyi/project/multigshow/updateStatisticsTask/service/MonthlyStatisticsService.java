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

    // 在Service层或Mapper层中打印日志，查看查询结果
    public List<MonthlyStatistics> getAllMonthlyStatistics() {
        List<MonthlyStatistics> statistics = statisticsMapper.selectAllMonthlyStatistics();
        System.out.println("Fetched Statistics: " + statistics);  // 使用日志框架更为合适
        return statistics;
    }

}

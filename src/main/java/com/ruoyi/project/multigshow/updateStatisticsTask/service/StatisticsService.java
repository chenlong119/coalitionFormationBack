package com.ruoyi.project.multigshow.updateStatisticsTask.service;

import com.ruoyi.project.multigshow.updateStatisticsTask.domain.MonthlyStatistics;
import com.ruoyi.project.multigshow.updateStatisticsTask.mapper.MonthlyStatisticsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
@Service
public class StatisticsService {

    @Autowired
    private MonthlyStatisticsMapper statisticsMapper;
    private static final Logger logger = LoggerFactory.getLogger(StatisticsService.class);
    public void calculateAndStoreMonthlyStatistics() {
        logger.info("Executing calculateAndStoreMonthlyStatistics");
        // 获取当前月份
        LocalDate currentDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM");
        String currentMonth = currentDate.format(formatter);

        // 计算90分以上的企业数量
        int highScoreCount = calculateHighScoreCount();

        // 构造统计数据对象
        MonthlyStatistics statistics = new MonthlyStatistics();
        statistics.setMonth(currentMonth);
        statistics.setHighScoreCount(highScoreCount);

        // 存储统计数据
        statisticsMapper.insertMonthlyStatistics(statistics);
    }

    private int calculateHighScoreCount() {

        return statisticsMapper.countHighScoreCompanies(90);
    }
}

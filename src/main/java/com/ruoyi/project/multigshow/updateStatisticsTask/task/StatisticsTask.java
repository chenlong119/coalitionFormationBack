package com.ruoyi.project.multigshow.updateStatisticsTask.task;

import com.ruoyi.project.multigshow.updateStatisticsTask.service.StatisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.EnableScheduling;
@Component
@EnableScheduling
public class StatisticsTask {

    @Autowired
    private StatisticsService statisticsService;
    private static final Logger logger = LoggerFactory.getLogger(StatisticsService.class);
    @Scheduled(cron = "0 0 0 1 * ?")  
    public void generateMonthlyStatistics() {
        try {
            statisticsService.calculateAndStoreMonthlyStatistics();
        } catch (Exception e) {
            // 如果有异常，这里会捕捉到并打印日志
            logger.error("Error during statistics generation", e);
        }
    }
}

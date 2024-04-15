package com.ruoyi.project.multigshow.updateStatisticsTask.controller;

import com.ruoyi.project.multigshow.updateStatisticsTask.domain.MonthlyStatistics;
import com.ruoyi.project.multigshow.updateStatisticsTask.service.MonthlyStatisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/statistics")
public
class MonthlyStatisticsController {

    @Autowired
    private MonthlyStatisticsService statisticsService;

    @GetMapping("/monthly")
    public ResponseEntity<List<MonthlyStatistics>> getAllMonthlyStatistics() {
        List<MonthlyStatistics> statistics = statisticsService.getAllMonthlyStatistics();
        return ResponseEntity.ok(statistics);
    }
}

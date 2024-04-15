package com.ruoyi.project.multigshow.updateStatisticsTask.mapper;

import com.ruoyi.project.multigshow.updateStatisticsTask.domain.MonthlyStatistics;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface MonthlyStatisticsMapper {
    void insertMonthlyStatistics(MonthlyStatistics statistics);
    int countHighScoreCompanies(int score);
    List<MonthlyStatistics> selectAllMonthlyStatistics();
}

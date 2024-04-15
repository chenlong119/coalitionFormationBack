package com.ruoyi.project.multigshow.updateStatisticsTask.domain;

public class MonthlyStatistics {
    private Long id;
    private String month;
    private Integer highScoreCount;

    // 构造方法
    public MonthlyStatistics() {}

    public MonthlyStatistics(Long id, String month, Integer highScoreCount) {
        this.id = id;
        this.month = month;
        this.highScoreCount = highScoreCount;
    }

    // Getters
    public Long getId() {
        return id;
    }

    public String getMonth() {
        return month;
    }

    public Integer getHighScoreCount() {
        return highScoreCount;
    }

    // Setters
    public void setId(Long id) {
        this.id = id;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public void setHighScoreCount(Integer highScoreCount) {
        this.highScoreCount = highScoreCount;
    }

    // toString() 方法（可选，用于调试）
    @Override
    public String toString() {
        return "MonthlyStatistics{" +
                "id=" + id +
                ", month='" + month + '\'' +
                ", highScoreCount=" + highScoreCount +
                '}';
    }
}

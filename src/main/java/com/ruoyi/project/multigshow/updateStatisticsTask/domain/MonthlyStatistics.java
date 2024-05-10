package com.ruoyi.project.multigshow.updateStatisticsTask.domain;

import lombok.Data;

@Data
public class MonthlyStatistics {
    private Long id;
    private String month;
    private Integer highScoreCount;
    private Integer layer_id;  

 
    public MonthlyStatistics() {}

    // 全参数构造方法
    public MonthlyStatistics(Long id, String month, Integer highScoreCount, Integer layer_id) {
        this.id = id;
        this.month = month;
        this.highScoreCount = highScoreCount;
        this.layer_id = layer_id;
    }

    // 由于使用了 @Data，下面的所有getter和setter方法都不是必需的，
    // Lombok 会自动为所有字段生成。这里提供注释掉的方法作为参考：

    // Getters
    /*
    public Long getId() {
        return id;
    }

    public String getMonth() {
        return month;
    }

    public Integer getHighScoreCount() {
        return highScoreCount;
    }

    public Integer getLayer_id() {
        return layer_id;
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

    public void setLayer_id(Integer layer_id) {
        this.layer_id = layer_id;
    }
    */

    // toString() 方法，用于调试和日志输出
    @Override
    public String toString() {
        return "MonthlyStatistics{" +
                "id=" + id +
                ", month='" + month + '\'' +
                ", highScoreCount=" + highScoreCount +
                ", layer_id=" + layer_id +
                '}';
    }
}

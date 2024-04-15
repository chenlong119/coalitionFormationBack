package com.ruoyi.project.multimode.domain;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Mode {
    private Integer mode;
    private String modeName;
    private Integer competitionNum;
    private Integer failureNum;

    // 完成率
    public double getCompletionRate() {
        int total = competitionNum + failureNum;
        return total > 0 ? (double) competitionNum / total : 0;
    }

    // 失败率
    public double getFailureRate() {
        int total = competitionNum + failureNum;
        return total > 0 ? (double) failureNum / total : 0;
    }

}


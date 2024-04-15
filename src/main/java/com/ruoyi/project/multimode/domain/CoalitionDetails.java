package com.ruoyi.project.multimode.domain;

import lombok.Data;
import lombok.ToString;

import java.time.LocalDateTime;
@Data
@ToString

public class CoalitionDetails {
    private Integer coalitionId;
    private String coalitionName;
    private Integer taskId;
    private Integer companyCount; // Calculated from CoalitionCompany
    private Integer mode;
    private LocalDateTime createTime;
    private Integer coalitionStatus;
    private String modeName; // 新增字段
}

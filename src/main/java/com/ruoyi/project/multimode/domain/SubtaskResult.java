package com.ruoyi.project.multimode.domain;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class SubtaskResult {
    private Integer companyId;
    private String companyName;
    private Integer layerId;
    private Integer groupId;
    private Integer taskId;
    private Integer subtaskId; // This would be generated during the splitting process
    private Double cost; // Calculated based on task val, duration, and company processRate
    private Double time; // Calculated similarly
}

package com.ruoyi.project.multimode.domain;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class BusinessDirection {
    private String sourceId;
    private String goalId;
    private String historyId;
    private String taskId;
    private String mode;
    private String locationId;
    private String modeId;
}

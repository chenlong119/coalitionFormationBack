package com.ruoyi.project.multimode.domain;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class BusinessHistory {
    private String historyId;
    private String taskId;
    private String taskName;
    private String deliveryDate;
    private String deliveryExperience;

}

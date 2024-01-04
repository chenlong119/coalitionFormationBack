package com.ruoyi.project.multimode.domain;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class ModeEvaluate {
    private String modeName;
    private String completionRate;
    private String failureRate;
}

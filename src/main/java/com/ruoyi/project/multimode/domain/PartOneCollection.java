package com.ruoyi.project.multimode.domain;
import lombok.Data;

import java.util.List;

@Data

public class PartOneCollection {
    private Integer taskId;
    private String taskName; // 任务名称
    private List<Integer> originalCompanyId; // 故障前企业名称列表
    private List<Integer> machineCompanyId; // 故障后企业名称列表
    private List<String> originalCompanyNames; // 故障前企业名称列表
    private List<String> machineCompanyNames; // 故障后企业名称列表
    private String crossInfo; // 跨企业、跨群组、跨链信息
    private Integer mode; // 模式
}

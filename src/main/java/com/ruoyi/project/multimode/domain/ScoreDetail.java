package com.ruoyi.project.multimode.domain;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class ScoreDetail {
    private Integer id;
    private Integer taskId;
    private Integer companyId;
    private Integer evaluatedCompanyId;
    private Integer score;
    private String taskName;
    private String companyName;
    private String evaluatedCompanyName;

}

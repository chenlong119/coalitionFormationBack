package com.ruoyi.project.shareIncentive.domain;

import lombok.Data;
import lombok.ToString;
@Data
@ToString
public class CompanyIncomeDto {
    private Integer companyId;
//    private Integer layerId;
    private Double marketShare;
    private Double marketIncrease;
    private Double profitability;
    private Double productWidth;
    private Double productDepth;
    private Double averageRio;
    private Double turnOver;
}

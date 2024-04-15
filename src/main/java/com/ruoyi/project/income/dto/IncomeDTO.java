package com.ruoyi.project.income.dto;


import lombok.Data;

import java.math.BigDecimal;

@Data
public class IncomeDTO {
    private Integer companyId;
    private String name;
    private String field;
    private String category;
    private Double marketShare;
    private Double marketIncrease;
    private Double turnover;
    private Double deliveryRate;
    private Double earningsRate;
    private Double averageRoi;
    private BigDecimal liability;
    private BigDecimal ownerEquity;
}

package com.ruoyi.project.income.dto;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class RelatedCompanyDTO {
    private Integer companyId;
    private Integer layerId;
    private String chainName;
    private String field;
    private String name;
    private Double marketShare;
    private Double marketIncrease;
    private Double turnover;
    private Double deliveryRate;
    private Double earningsRate;
    private Double averageRoi;
    private BigDecimal liability;
    private BigDecimal ownerEquity;
    private Integer isSupply;
    private Integer isCooperation;
    private Integer isCompetition;
    private Double totalRelation;
    private String analysis;
}

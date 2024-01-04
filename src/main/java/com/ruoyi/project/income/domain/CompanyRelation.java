package com.ruoyi.project.income.domain;

import lombok.Data;

@Data
public class CompanyRelation {
    private Integer id;
    private Integer sourceId;
    private Integer targetId;
    private Integer isSupply;
    private Integer isCooperation;
    private Integer isCompetition;
    private Double totalRelation;
    private String analysis;
}

package com.ruoyi.project.dataFusion.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Link {
    private Integer id;
    private Integer sourceLocation;
    private Integer targetLocation;
    private Double strengthRelation;
    private Double competitionRelation;
    private Double supplyRelation;
    private Double cooperationRelation;
    private String analysis;
}

package com.ruoyi.project.dataFusion.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Relation {
    private Integer sourceId;
    private Integer targetId;
    private Integer isSupply;
    private Integer isCooperation;
    private Integer isCompetition;
}

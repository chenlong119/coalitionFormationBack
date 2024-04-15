package com.ruoyi.project.dataFusion.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CompanyLocation {
    private Integer id;
    private Double locationX;
    private Double locationY;
    private Integer layer;
    private Integer companyId;
}

package com.ruoyi.project.generate.company.domain;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class CompanyCoalition {
    Integer coalitionId;
    Integer companyId;
    Integer layerId;
    String companyName;
}

package com.ruoyi.project.multimode.domain;
import lombok.Data;
import lombok.ToString;

import java.math.BigDecimal;

@Data
@ToString
public class ScoreRecord2 {
    private Integer id;
    private Integer taskId;
    private Integer companyId;
    private Integer evaluatedCompanyId;
    private BigDecimal score;
}

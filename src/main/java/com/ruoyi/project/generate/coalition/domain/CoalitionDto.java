package com.ruoyi.project.generate.coalition.domain;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class CoalitionDto {
    Integer pageNum;
    Integer pageSize;
    Integer id;
    Integer taskId;
    Integer companyId;
}

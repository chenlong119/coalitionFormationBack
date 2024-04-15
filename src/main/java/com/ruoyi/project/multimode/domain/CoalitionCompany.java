package com.ruoyi.project.multimode.domain;

import lombok.Data;
import lombok.ToString;

import java.time.LocalDateTime;

@Data
@ToString
public class CoalitionCompany {
    private Integer coalitionId;
    private Integer companyId;
    private Integer layerId;
    private Integer dateNumber;
    private Integer actualNumber;
    private LocalDateTime dateTime;
    private LocalDateTime actualTime;
}
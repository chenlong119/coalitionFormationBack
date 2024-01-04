package com.ruoyi.project.multimode.domain;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class BusinessLocation {

    private String businessId;
    private String x;
    private String y;
    private String BusinessName;
    private String BusinessGroupName;
    private String BusinessGroupId;

}

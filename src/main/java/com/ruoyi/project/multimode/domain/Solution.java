package com.ruoyi.project.multimode.domain;
import lombok.Data;
import lombok.ToString;

import java.util.List;

@Data
@ToString
public class Solution {
    private Integer taskId;
    private List<String> companyName;
    private List<Integer> companyId;
    private String crossInfo;
    private Integer mode;
}

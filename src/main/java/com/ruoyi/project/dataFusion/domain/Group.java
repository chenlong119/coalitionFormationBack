package com.ruoyi.project.dataFusion.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Group {
    private String name;
    private String list;
    private Integer value;
    private String describe;
}

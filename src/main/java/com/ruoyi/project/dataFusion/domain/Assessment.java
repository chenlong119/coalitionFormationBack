package com.ruoyi.project.dataFusion.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data

@AllArgsConstructor
@NoArgsConstructor
public class Assessment {

    private Integer id;

    private String name;
    private Integer assessment1;
    private Integer assessment2;
    private Integer assessment3;
    private Integer assessment;
    private String comment;
    private LocalDateTime commentTime;
}

package com.ruoyi.project.coalitionformation.entity;
import lombok.Data;
import lombok.ToString;

import java.time.LocalDateTime;

@Data
@ToString
public class Coalition {
    private Integer id;
    private String name;
    private Integer taskId;
    private LocalDateTime createTime;
    private Integer coalitionStatus;
    private Integer mode;
}

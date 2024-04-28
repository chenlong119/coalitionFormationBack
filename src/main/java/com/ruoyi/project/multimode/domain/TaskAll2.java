package com.ruoyi.project.multimode.domain;
import com.sun.jna.platform.unix.solaris.Kstat2;
import lombok.Data;
import lombok.ToString;

import java.time.LocalDateTime;
@Data
@ToString
public class TaskAll2 {
    private Integer id;
    private Integer taskType;
    private String name;
    private Integer val;
    private LocalDateTime arrivalTime;
    private LocalDateTime coalitionTime;
    private LocalDateTime finishTime;
    private Integer taskStatus;
    private Integer duration;
    private Integer productId;
    private Integer coalitionId;
    private Integer chainId;
}

package com.ruoyi.project.taskallocation.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;
import java.time.LocalDate;
import lombok.Data;
import lombok.ToString;

/**
 * 系统任务管理对象 task
 *
 * @author cl
 * @date 2023-12-12
 */
@Data
@ToString
public class Task extends BaseEntity {
  private static final long serialVersionUID = 1L;

  /** 任务编号 */
  private Long id;

  /** 任务名称 */
  @Excel(name = "任务名称")
  private String name;

  /** 任务所需资源数量 */
  @Excel(name = "任务所需资源数量")
  private Long resourceNum;

  /** 任务价值 */
  @Excel(name = "任务价值")
  private Long value;

  /** 截止日期 */
  @JsonFormat(pattern = "yyyy-MM-dd")
  @Excel(name = "截止日期", width = 30, dateFormat = "yyyy-MM-dd")
  private LocalDate ddl;

  /** 持续时长 */
  @Excel(name = "持续时长")
  private Long duration;

  /** 任务状态 */
  @Excel(name = "任务状态")
  private Long state;

  /** 任务到达时间 */
  @JsonFormat(pattern = "yyyy-MM-dd")
  @Excel(name = "任务到达时间", width = 30, dateFormat = "yyyy-MM-dd")
  private LocalDate arrivalTime;

  private String allocbusiness;
}

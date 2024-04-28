package com.ruoyi.project.generate.taskcoalition.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;
import lombok.Data;
import lombok.ToString;

import java.util.Date;

/**
 * 任务信息对象 task_all
 *
 * @author cl
 * @date 2024-04-10
 */
@Data
@ToString
public class TaskAll extends BaseEntity {
  private static final long serialVersionUID = 1L;

  /** 任务编号 */
  private Integer id;

  /** 任务名称 */
  @Excel(name = "任务名称")
  private String name;

  /** 任务价值 */
  @Excel(name = "任务价值")
  private Integer val;

  @Excel(name = "任务类型")
    private Integer taskType;

  /** 任务到达时间 */
  @JsonFormat(pattern = "yyyy-MM-dd")
  @Excel(name = "任务到达时间", width = 30, dateFormat = "yyyy-MM-dd")
  private Date arrivalTime;

  /** 联盟形成时间 */
  @JsonFormat(pattern = "yyyy-MM-dd")
  @Excel(name = "联盟形成时间", width = 30, dateFormat = "yyyy-MM-dd")
  private Date coalitionTime;

  /** 任务完成时间 */
  @JsonFormat(pattern = "yyyy-MM-dd")
  @Excel(name = "任务完成时间", width = 30, dateFormat = "yyyy-MM-dd")
  private Date finishTime;

  /** 任务状态（0 等待分配，1 已分配，2已完成） */
  @Excel(name = "任务状态", readConverterExp = "0=,等=待分配，1,已=分配，2已完成")
  private Integer taskStatus;

  /** 任务持续时长 */
  @Excel(name = "任务持续时长")
  private Integer duration;

  /** 产品编号 */
  @Excel(name = "产品编号")
  private Integer productId;

  /** 联盟编号 */
  @Excel(name = "联盟编号")
  private Integer coalitionId;

  /** 所属产业链编号 */
  @Excel(name = "所属产业链编号")
  private Integer chainId;

  /** 任务所属企业编号 */
  @Excel(name = "任务所属企业编号")
  private Integer companyId;
}

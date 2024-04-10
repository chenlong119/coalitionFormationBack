package com.ruoyi.project.generate.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;
import java.util.Date;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 任务信息对象 task_all
 *
 * @author cl
 * @date 2024-04-10
 */
public class TaskAll extends BaseEntity {
  private static final long serialVersionUID = 1L;

  /** 任务编号 */
  private Long id;

  /** 任务名称 */
  @Excel(name = "任务名称")
  private String name;

  /** 任务价值 */
  @Excel(name = "任务价值")
  private Long val;

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
  private Long taskStatus;

  /** 任务持续时长 */
  @Excel(name = "任务持续时长")
  private Long duration;

  /** 产品编号 */
  @Excel(name = "产品编号")
  private Long productId;

  /** 联盟编号 */
  @Excel(name = "联盟编号")
  private Long coalitionId;

  /** 所属产业链编号 */
  @Excel(name = "所属产业链编号")
  private Long chainId;

  /** 任务所属企业编号 */
  @Excel(name = "任务所属企业编号")
  private Long companyId;

  public void setId(Long id) {
    this.id = id;
  }

  public Long getId() {
    return id;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getName() {
    return name;
  }

  public void setVal(Long val) {
    this.val = val;
  }

  public Long getVal() {
    return val;
  }

  public void setArrivalTime(Date arrivalTime) {
    this.arrivalTime = arrivalTime;
  }

  public Date getArrivalTime() {
    return arrivalTime;
  }

  public void setCoalitionTime(Date coalitionTime) {
    this.coalitionTime = coalitionTime;
  }

  public Date getCoalitionTime() {
    return coalitionTime;
  }

  public void setFinishTime(Date finishTime) {
    this.finishTime = finishTime;
  }

  public Date getFinishTime() {
    return finishTime;
  }

  public void setTaskStatus(Long taskStatus) {
    this.taskStatus = taskStatus;
  }

  public Long getTaskStatus() {
    return taskStatus;
  }

  public void setDuration(Long duration) {
    this.duration = duration;
  }

  public Long getDuration() {
    return duration;
  }

  public void setProductId(Long productId) {
    this.productId = productId;
  }

  public Long getProductId() {
    return productId;
  }

  public void setCoalitionId(Long coalitionId) {
    this.coalitionId = coalitionId;
  }

  public Long getCoalitionId() {
    return coalitionId;
  }

  public void setChainId(Long chainId) {
    this.chainId = chainId;
  }

  public Long getChainId() {
    return chainId;
  }

  public void setCompanyId(Long companyId) {
    this.companyId = companyId;
  }

  public Long getCompanyId() {
    return companyId;
  }

  @Override
  public String toString() {
    return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
        .append("id", getId())
        .append("name", getName())
        .append("val", getVal())
        .append("arrivalTime", getArrivalTime())
        .append("coalitionTime", getCoalitionTime())
        .append("finishTime", getFinishTime())
        .append("taskStatus", getTaskStatus())
        .append("duration", getDuration())
        .append("productId", getProductId())
        .append("coalitionId", getCoalitionId())
        .append("chainId", getChainId())
        .append("companyId", getCompanyId())
        .toString();
  }
}

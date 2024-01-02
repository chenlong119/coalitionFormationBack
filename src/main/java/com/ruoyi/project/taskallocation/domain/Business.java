package com.ruoyi.project.taskallocation.domain;

import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;
import lombok.Data;
import lombok.ToString;

/**
 * 企业信息对象 business
 *
 * @author cl
 * @date 2023-12-05
 */
@Data
@ToString
public class Business extends BaseEntity {
  private static final long serialVersionUID = 1L;

  /** 企业编号 */
  private Long id;

  /** 企业名称 */
  @Excel(name = "企业名称")
  private String name;

  /** 企业邻居节点 */
  @Excel(name = "企业邻居节点")
  private String neighbor;

  /** 具有技能种类数量 */
  @Excel(name = "具有技能种类数量")
  private Long skillNum;

  /** 企业地址 */
  @Excel(name = "企业地址")
  private String address;

  /** 所属产业链 */
  @Excel(name = "所属产业链")
  private String chain;

  /** 所属园区 */
  @Excel(name = "所属园区")
  private String park;

  /** 当前状态 */
  @Excel(name = "当前状态")
  private Long state;

  /** 当前是否有任务发布 */
  @Excel(name = "当前是否有任务发布")
  private Long ispublish;

  /** 所属网络层 */
  private Long layer;

  private Long task;

  private Double longitude;

  private Double latitude;
}

package com.ruoyi.project.taskallocation.domain;

import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class BusinessDto {

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
  private String state;

  private Long task;
}

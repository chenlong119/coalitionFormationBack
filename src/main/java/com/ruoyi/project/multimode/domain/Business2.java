package com.ruoyi.project.multimode.domain;

import lombok.Data;
import lombok.ToString;

/**
 * 企业群信息表 对象 businessGroup
 *
 * @date 2023-11-20
 */
@Data
@ToString
public class Business2 {
  private static final long serialVersionUID = 1L;

  /** 企业ID */
  private String businessId;

  /** 企业姓名 */
  private String businessName;

  /** 企业群ID */
  private String businessGroupId;

  /** 企业群姓名 */
  private String businessGroupName;

  /** 任务ID */
  private String taskId;

  /** 产业链ID */
  private String businessLinkId;

  /** 产业链名称 */
  private String businessLinkName;
}

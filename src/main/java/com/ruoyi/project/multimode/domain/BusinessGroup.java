package com.ruoyi.project.multimode.domain;

import java.util.List;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.ToString;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 企业群信息表 对象 businessGroup
 *
 * @date 2023-11-15
 */
@Data
@ToString
public class BusinessGroup {

    private static final long serialVersionUID = 1L;

    /** 企业群ID */
    private String businessGroupId;

    /** 企业群编号 */
    @Excel(name = "企业群编号")
    private String businessGroupNo;

    /** 企业群业务数 */
    @Excel(name = "企业群业务数")
    private Integer businessGroupBusinessnum;

    /** 企业群名称 */
    @Excel(name = "企业群名称")
    private String businessGroupName;

    /** 参与任务 */
    @Excel(name = "参与任务")
    private String businessGroupTask;

    /** 协同模式 */
    @Excel(name = "协同模式")
    private String businessGroupMode;

}
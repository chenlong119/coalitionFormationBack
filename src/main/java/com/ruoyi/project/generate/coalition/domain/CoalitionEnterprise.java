package com.ruoyi.project.generate.coalition.domain;

import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;
import lombok.Data;
import lombok.ToString;

/**
 * 企业联盟对象 coalition
 * 
 * @author cl
 * @date 2024-04-15
 */
@Data
@ToString
public class CoalitionEnterprise extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 联盟编号 */
    private Long id;

    /** 联盟名称 */
    @Excel(name = "联盟名称")
    private String name;

    /** 联盟任务编号 */
    @Excel(name = "联盟任务编号")
    private Long taskId;

    /** 联盟状态（0异常，1工作，2空闲） */
    @Excel(name = "联盟状态", readConverterExp = "0=异常，1工作，2空闲")
    private Long coalitionStatus;

    /** 联盟模式 */
    @Excel(name = "联盟模式")
    private Long mode;

}

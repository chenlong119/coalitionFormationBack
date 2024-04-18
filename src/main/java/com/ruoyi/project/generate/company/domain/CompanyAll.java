package com.ruoyi.project.generate.company.domain;

import lombok.Data;
import lombok.ToString;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 企业信息对象 company_all
 * 
 * @author cl
 * @date 2024-04-02
 */
@Data
@ToString
public class CompanyAll extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 企业编号 */
    private Long id;

    /** 企业名称 */
    @Excel(name = "企业名称")
    private String name;

    /** 产业链网络层编号 */
    @Excel(name = "产业链网络层编号")
    private Long layerId;

    /** 企业地址 */
    @Excel(name = "企业地址")
    private String address;

    /** 企业类型 */
    @Excel(name = "企业类型")
    private String companyType;

    /** 所属产业链名称 */
    @Excel(name = "所属产业链名称")
    private String chainName;

    /** 所属企业群id */
    @Excel(name = "所属企业群id")
    private Long groupId;

    private Long coalitionId;

    /** 任务完成速率 */
    private Long processRate;

    /** 企业信誉 */
    @Excel(name = "企业信誉")
    private Long rep;

    /** 企业状态（0异常，1空闲，2工作） */
    @Excel(name = "企业状态", readConverterExp = "0=异常，1空闲，2工作")
    private Long status;

}

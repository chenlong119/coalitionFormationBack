package com.ruoyi.project.generate.company.domain;

import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;
import lombok.Data;
import lombok.ToString;

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
    private Integer id;

    /** 企业名称 */
    @Excel(name = "企业名称")
    private String name;

    @Excel(name = "企业类型")
    private Integer companyType;
    /** 产业链网络层编号 */
    @Excel(name = "产业链网络层编号")
    private Integer layerId;

    /** 企业地址 */
    @Excel(name = "企业地址")
    private String address;

    /** 所属企业群id */
    @Excel(name = "所属企业群id")
    private Integer groupId;

    private Integer coalitionId;

    /** 任务完成速率 */
    private Integer processRate;

    /** 企业信誉 */
    @Excel(name = "企业信誉")
    private Integer rep;

    private String chainName;

    /** 企业状态（0异常，1空闲，2工作） */
    @Excel(name = "企业状态", readConverterExp = "0=异常，1空闲，2工作")
    private Integer status;

}

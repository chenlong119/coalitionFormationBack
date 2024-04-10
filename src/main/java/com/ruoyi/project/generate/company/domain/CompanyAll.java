package com.ruoyi.project.generate.company.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 企业信息对象 company_all
 * 
 * @author cl
 * @date 2024-04-02
 */
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

    /** 任务完成速率 */
    private Long processRate;

    /** 企业信誉 */
    @Excel(name = "企业信誉")
    private Long rep;

    /** 企业状态（0异常，1空闲，2工作） */
    @Excel(name = "企业状态", readConverterExp = "0=异常，1空闲，2工作")
    private Long status;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setLayerId(Long layerId) 
    {
        this.layerId = layerId;
    }

    public Long getLayerId() 
    {
        return layerId;
    }
    public void setAddress(String address) 
    {
        this.address = address;
    }

    public String getAddress() 
    {
        return address;
    }
    public void setCompanyType(String companyType) 
    {
        this.companyType = companyType;
    }

    public String getCompanyType() 
    {
        return companyType;
    }
    public void setChainName(String chainName) 
    {
        this.chainName = chainName;
    }

    public String getChainName() 
    {
        return chainName;
    }
    public void setGroupId(Long groupId) 
    {
        this.groupId = groupId;
    }

    public Long getGroupId() 
    {
        return groupId;
    }
    public void setProcessRate(Long processRate) 
    {
        this.processRate = processRate;
    }

    public Long getProcessRate() 
    {
        return processRate;
    }
    public void setRep(Long rep) 
    {
        this.rep = rep;
    }

    public Long getRep() 
    {
        return rep;
    }
    public void setStatus(Long status) 
    {
        this.status = status;
    }

    public Long getStatus() 
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("layerId", getLayerId())
            .append("address", getAddress())
            .append("companyType", getCompanyType())
            .append("chainName", getChainName())
            .append("groupId", getGroupId())
            .append("processRate", getProcessRate())
            .append("rep", getRep())
            .append("status", getStatus())
            .toString();
    }
}

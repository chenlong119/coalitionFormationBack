package com.ruoyi.project.generate.coalition.domain;

import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 企业联盟对象 coalition
 * 
 * @author cl
 * @date 2024-04-15
 */
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
    public void setTaskId(Long taskId) 
    {
        this.taskId = taskId;
    }

    public Long getTaskId() 
    {
        return taskId;
    }
    public void setCoalitionStatus(Long coalitionStatus) 
    {
        this.coalitionStatus = coalitionStatus;
    }

    public Long getCoalitionStatus() 
    {
        return coalitionStatus;
    }
    public void setMode(Long mode) 
    {
        this.mode = mode;
    }

    public Long getMode() 
    {
        return mode;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("taskId", getTaskId())
            .append("createTime", getCreateTime())
            .append("coalitionStatus", getCoalitionStatus())
            .append("mode", getMode())
            .toString();
    }
}

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
 * @date 2023-11-21
 */
@Data
@ToString
public class Tasklist {

    private static final long serialVersionUID = 1L;

    /** 任务ID */
    private String taskId;

    /** 任务名称 */
    private String taskName;
}

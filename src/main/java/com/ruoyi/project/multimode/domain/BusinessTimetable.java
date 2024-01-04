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
public class BusinessTimetable {

    private static final long serialVersionUID = 1L;

    /** 任务列表ID */
    private String businessTimetableId;

    /** 企业ID */
    private String businessId;

    /** 企业姓名 */
    private String businessName;

    /** 任务ID */
    private String taskId;

    /** 子任务ID */
    private String subtaskId;

    /** 时间 */
    private String time;

    /** 成本 */
    private String cost;
}

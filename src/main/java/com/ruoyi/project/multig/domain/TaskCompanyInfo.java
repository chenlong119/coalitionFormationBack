package com.ruoyi.project.multig.domain;

import java.time.LocalDateTime;

public class TaskCompanyInfo {
    private Long id;

    private Long task_info;

    private Long company_info;
    private Integer date_number;

    private LocalDateTime date_time;

    // 构造函数
    public TaskCompanyInfo() {
    }

    // Getters 和 Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getTaskId() {
        return task_info;
    }

    public void setTaskId(Long task_info) {
        this.task_info = task_info;
    }

    public Long getCompanyId() {
        return company_info;
    }

    public void setCompanyId(Long company_info) {
        this.company_info = company_info;
    }

    public Integer getExpectedQuantity() {
        return date_number;
    }

    public void setExpectedQuantity(Integer date_number) {
        this.date_number = date_number;
    }

    public LocalDateTime getExpectedDeliveryTime() {
        return date_time;
    }

    public void setExpectedDeliveryTime(LocalDateTime date_time){
        this.date_time = date_time;
    }

    @Override
    public String toString() {
        return "TaskCompanyInfo{" +
                "id=" + id +
                ", task_info=" + task_info+
                ", companyId=" + company_info +
                ", expectedQuantity=" + date_number +
                ", expectedDeliveryTime=" + date_time +
                '}';
    }
}

package com.ruoyi.project.shareIncentive.domain;

import java.io.Serializable;
public class Request implements Serializable {
    private Integer requestId;

    public String getRequestName() {
        return requestName;
    }

    public void setRequestName(String requestName) {
        this.requestName = requestName;
    }

    private String requestName;
    private String description;
    private String industryChain;
    private String dataType;
    private String targetCompanies;

    private  String status;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDeadline() {
        return deadline;
    }

    public void setDeadline(String deadline) {
        this.deadline = deadline;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    private  String deadline;
    private String detail;

    // Getters and Setters
    public Integer getRequestId() {
        return requestId;
    }

    public void setRequestId(Integer requestId) {
        this.requestId = requestId;
    }



    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getIndustryChain() {
        return industryChain;
    }

    public void setIndustryChain(String industryChain) {
        this.industryChain = industryChain;
    }

    public String getDataType() {
        return dataType;
    }

    public void setDataType(String dataType) {
        this.dataType = dataType;
    }

    public String getTargetCompanies() {
        return targetCompanies;
    }

    public void setTargetCompanies(String targetCompanies) {
        this.targetCompanies = targetCompanies;
    }
}

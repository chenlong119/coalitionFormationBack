package com.ruoyi.project.shareIncentive.domain;

import java.time.LocalDateTime;

public class CompanyGroup {
    private Integer id;
    private Integer groupId;
    private  Integer companyId;
    private LocalDateTime joinTime ;
    private String sumData;
    private String averageScore;
    private String idealIncome;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }

    public LocalDateTime getJoinTime() {
        return joinTime;
    }

    public void setJoinTime(LocalDateTime joinTime) {
        this.joinTime = joinTime;
    }

    public String getSumData() {
        return sumData;
    }

    public void setSumData(String sumData) {
        this.sumData = sumData;
    }

    public String getAverageScore() {
        return averageScore;
    }

    public void setAverageScore(String averageScore) {
        this.averageScore = averageScore;
    }

    public String getIdealIncome() {
        return idealIncome;
    }

    public void setIdealIncome(String idealIncome) {
        this.idealIncome = idealIncome;
    }

    public String getCreditLevel() {
        return creditLevel;
    }

    public void setCreditLevel(String creditLevel) {
        this.creditLevel = creditLevel;
    }

    private  String creditLevel;
}

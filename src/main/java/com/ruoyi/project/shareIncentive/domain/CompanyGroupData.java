package com.ruoyi.project.shareIncentive.domain;

import java.time.LocalDateTime;

public class CompanyGroupData {
    private Integer id;
    private Integer groupId;
    private String dataName;

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

    public String getDataName() {
        return dataName;
    }

    public void setDataName(String dataName) {
        this.dataName = dataName;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public LocalDateTime getUploadaDate() {
        return uploadaDate;
    }

    public void setUploadaDate(LocalDateTime uploadaDate) {
        this.uploadaDate = uploadaDate;
    }

    public String getHisClick() {
        return hisClick;
    }

    public void setHisClick(String hisClick) {
        this.hisClick = hisClick;
    }

    public String getRecClick() {
        return recClick;
    }

    public void setRecClick(String recClick) {
        this.recClick = recClick;
    }

    public String getHisDownload() {
        return hisDownload;
    }

    public void setHisDownload(String hisDownload) {
        this.hisDownload = hisDownload;
    }

    public String getRecDownload() {
        return recDownload;
    }

    public void setRecDownload(String recDownload) {
        this.recDownload = recDownload;
    }

    public String getHisScore() {
        return hisScore;
    }

    public void setHisScore(String hisScore) {
        this.hisScore = hisScore;
    }

    public String getRecScore() {
        return recScore;
    }

    public void setRecScore(String recScore) {
        this.recScore = recScore;
    }

    public String getChain() {
        return chain;
    }

    public void setChain(String chain) {
        this.chain = chain;
    }

    private  String company;
    private LocalDateTime uploadaDate;
    private  String hisClick;
    private  String recClick;
    private  String hisDownload;
    private  String recDownload;
    private  String hisScore;
    private  String recScore;
    private  String chain;



}

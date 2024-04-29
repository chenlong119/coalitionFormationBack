package com.ruoyi.project.shareIncentive.domain;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public class Data {
    public Long getDataID() {
        return DataID;
    }

    public void setDataID(Long dataID) {
        DataID = dataID;
    }

    public String getDataName() {
        return DataName;
    }

    public void setDataName(String dataName) {
        DataName = dataName;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public BigDecimal getStartingPrice() {
        return StartingPrice;
    }

    public void setStartingPrice(BigDecimal startingPrice) {
        StartingPrice = startingPrice;
    }

    public BigDecimal getCurrentPrice() {
        return CurrentPrice;
    }

    public void setCurrentPrice(BigDecimal currentPrice) {
        CurrentPrice = currentPrice;
    }

    public LocalDateTime getStartTime() {
        return StartTime;
    }

    public void setStartTime(LocalDateTime startTime) {
        StartTime = startTime;
    }

    public LocalDateTime getEndTime() {
        return EndTime;
    }

    public void setEndTime(LocalDateTime endTime) {
        EndTime = endTime;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String status) {
        Status = status;
    }

    private Long DataID;
    private String DataName;
    private String Description;
    private BigDecimal StartingPrice;
    private BigDecimal CurrentPrice;
    private LocalDateTime StartTime;
    private LocalDateTime EndTime;
    private String Status;

    // Getters and Setters
}


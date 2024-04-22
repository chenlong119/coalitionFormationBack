package com.ruoyi.project.shareIncentive.domain;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public class AuctionRecord {
    public Long getRecordID() {
        return RecordID;
    }

    public void setRecordID(Long recordID) {
        RecordID = recordID;
    }

    public Long getUserID() {
        return UserID;
    }

    public void setUserID(Long userID) {
        UserID = userID;
    }

    public String getDataID() {
        return DataID;
    }

    public void setDataID(String dataID) {
        DataID = dataID;
    }

    public LocalDateTime getAuctionTime() {
        return AuctionTime;
    }

    public void setAuctionTime(LocalDateTime auctionTime) {
        AuctionTime = auctionTime;
    }

    public String getWinningPrice() {
        return WinningPrice;
    }

    public void setWinningPrice(String winningPrice) {
        WinningPrice = winningPrice;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String status) {
        Status = status;
    }

    private Long RecordID;
    private Long UserID;
    private String DataID;
    private LocalDateTime AuctionTime;
    private String WinningPrice;
    private String Status;

    // Getters and Setters
}



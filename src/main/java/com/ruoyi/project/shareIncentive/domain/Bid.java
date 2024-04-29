package com.ruoyi.project.shareIncentive.domain;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public class Bid {
    public Bid(){}
    public Long getBidID() {
        return BidID;
    }

    public void setBidID(Long bidID) {
        BidID = bidID;
    }

    public Long getUserID() {
        return UserID;
    }

    public void setUserID(Long userID) {
        UserID = userID;
    }

    public Long getDataID() {
        return DataID;
    }

    public void setDataID(Long dataID) {
        DataID = dataID;
    }

    public LocalDateTime getBidTime() {
        return BidTime;
    }

    public void setBidTime(LocalDateTime bidTime) {
        BidTime = bidTime;
    }

    public BigDecimal getBidAmount() {
        return BidAmount;
    }

    public void setBidAmount(BigDecimal bidAmount) {
        BidAmount = bidAmount;
    }

    private Long BidID;
    private Long UserID;
    private Long DataID;
    private LocalDateTime BidTime;
    private BigDecimal BidAmount;

    // Getters and Setters
}

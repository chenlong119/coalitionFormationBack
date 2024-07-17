package com.ruoyi.project.shareIncentive.domain;


import com.fasterxml.jackson.annotation.JsonFormat;

import java.time.LocalDateTime;

//@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-mm-dd HH:mm:ss", timezone = "GNT+8")
//@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
//@TableField("CREATE_TIME")
@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
public class BidCompanyGroup {
    private Integer bidId;
    private String userName;
    private Integer auctionId;
    private LocalDateTime bidTime;
    private String bidAmount;
    private LocalDateTime selectedDate;

    private String selected;

    public LocalDateTime getSelectedDate() {
        return selectedDate;
    }

    public void setSelectedDate(LocalDateTime selectedDate) {
        this.selectedDate = selectedDate;
    }

    public String getSelected() {
        return selected;
    }

    public void setSelected(String selected) {
        this.selected = selected;
    }

    public Integer getBidId() {
        return bidId;
    }

    public void setBidId(Integer bidId) {
        this.bidId = bidId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Integer getAuctionId() {
        return auctionId;
    }

    public void setAuctionId(Integer auctionId) {
        this.auctionId = auctionId;
    }

    public LocalDateTime getBidTime() {
        return bidTime;
    }

    public void setBidTime(LocalDateTime bidTime) {
        this.bidTime = bidTime;
    }

    public String getBidAmount() {
        return bidAmount;
    }

    public void setBidAmount(String bidAmount) {
        this.bidAmount = bidAmount;
    }

    @Override
    public String toString() {
        return "BidCompanyGroup{" +
                "bidId=" + bidId +
                ", userName='" + userName + '\'' +
                ", auctionId=" + auctionId +
                ", bidTime=" + bidTime +
                ", bidAmount='" + bidAmount + '\'' +
                ", selectedDate=" + selectedDate +
                ", selected='" + selected + '\'' +
                '}';
    }
}

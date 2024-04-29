package com.ruoyi.project.shareIncentive.domain;

public class CompanyGroupFormingAuction {
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    private  Integer id;
    private  String motivationTask;
    private String groupAuctionReleaser;
    private String requestDescription;
    private String companyAuctionLeft;
    private String profitAuctionStart;
    private String dateRelease;
    private String dateFinish;
    private String auctionState;

    public String getMotivationTask() {
        return motivationTask;
    }

    public void setMotivationTask(String motivationTask) {
        this.motivationTask = motivationTask;
    }

    public String getGroupAuctionReleaser() {
        return groupAuctionReleaser;
    }

    public void setGroupAuctionReleaser(String groupAuctionReleaser) {
        this.groupAuctionReleaser = groupAuctionReleaser;
    }

    public String getRequestDescription() {
        return requestDescription;
    }

    public void setRequestDescription(String requestDescription) {
        this.requestDescription = requestDescription;
    }

    public String getCompanyAuctionLeft() {
        return companyAuctionLeft;
    }

    public void setCompanyAuctionLeft(String companyAuctionLeft) {
        this.companyAuctionLeft = companyAuctionLeft;
    }

    public String getProfitAuctionStart() {
        return profitAuctionStart;
    }

    public void setProfitAuctionStart(String profitAuctionStart) {
        this.profitAuctionStart = profitAuctionStart;
    }

    public String getDateRelease() {
        return dateRelease;
    }

    public void setDateRelease(String dateRelease) {
        this.dateRelease = dateRelease;
    }

    public String getDateFinish() {
        return dateFinish;
    }

    public void setDateFinish(String dateFinish) {
        this.dateFinish = dateFinish;
    }

    public String getAuctionState() {
        return auctionState;
    }

    public void setAuctionState(String auctionState) {
        this.auctionState = auctionState;
    }

    public String getChain() {
        return chain;
    }

    public void setChain(String chain) {
        this.chain = chain;
    }

    private String chain;
}

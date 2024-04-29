package com.ruoyi.project.shareIncentive.domain;

import java.util.List;

public class AuctionTask {
    public AuctionTask() {
        // 默认无参构造函数
    }
    private String taskName;
    private String taskReleaser;
    private int profit;
    private String dataRelease;
    private String dataFinish;
    private String taskState;
    private String dataProviders;
    private String dataProviderValues;
    private String dataProviderRates;
    private String accepter;
    private String chain;
    private int commentScore;
    private String comment;
    private int enterpriseRelationshipStrength;
    private int sharedPointsGain;
    private int continuousSharingRewards;
    private int afterSalesEvaluationGain;

    public String getDataNames() {
        return dataNames;
    }

    public void setDataNames(String dataNames) {
        this.dataNames = dataNames;
    }

    private String dataNames;

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    public String getTaskReleaser() {
        return taskReleaser;
    }

    public void setTaskReleaser(String taskReleaser) {
        this.taskReleaser = taskReleaser;
    }

    public int getProfit() {
        return profit;
    }

    public void setProfit(int profit) {
        this.profit = profit;
    }

    public String getDataRelease() {
        return dataRelease;
    }

    public void setDataRelease(String dataRelease) {
        this.dataRelease = dataRelease;
    }

    public String getDataFinish() {
        return dataFinish;
    }

    public void setDataFinish(String dataFinish) {
        this.dataFinish = dataFinish;
    }

    public String getTaskState() {
        return taskState;
    }

    public void setTaskState(String taskState) {
        this.taskState = taskState;
    }

    public String getDataProviders() {
        return dataProviders;
    }

    public void setDataProviders(String dataProviders) {
        this.dataProviders = dataProviders;
    }

    public String getDataProviderValues() {
        return dataProviderValues;
    }

    public void setDataProviderValues(String dataProviderValues) {
        this.dataProviderValues = dataProviderValues;
    }

    public String getDataProviderRates() {
        return dataProviderRates;
    }

    public void setDataProviderRates(String dataProviderRates) {
        this.dataProviderRates = dataProviderRates;
    }

    public String getAccepter() {
        return accepter;
    }

    public void setAccepter(String accepter) {
        this.accepter = accepter;
    }

    public String getChain() {
        return chain;
    }

    public void setChain(String chain) {
        this.chain = chain;
    }

    public int getCommentScore() {
        return commentScore;
    }

    public void setCommentScore(int commentScore) {
        this.commentScore = commentScore;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getEnterpriseRelationshipStrength() {
        return enterpriseRelationshipStrength;
    }

    public void setEnterpriseRelationshipStrength(int enterpriseRelationshipStrength) {
        this.enterpriseRelationshipStrength = enterpriseRelationshipStrength;
    }

    public int getSharedPointsGain() {
        return sharedPointsGain;
    }

    public void setSharedPointsGain(int sharedPointsGain) {
        this.sharedPointsGain = sharedPointsGain;
    }

    public int getContinuousSharingRewards() {
        return continuousSharingRewards;
    }

    public void setContinuousSharingRewards(int continuousSharingRewards) {
        this.continuousSharingRewards = continuousSharingRewards;
    }

    public int getAfterSalesEvaluationGain() {
        return afterSalesEvaluationGain;
    }

    public void setAfterSalesEvaluationGain(int afterSalesEvaluationGain) {
        this.afterSalesEvaluationGain = afterSalesEvaluationGain;
    }
// getters and setters
}

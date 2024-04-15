package com.ruoyi.project.multig.domain;
import lombok.Data;
@Data
public class FeedbackAttributes {
    private int id;
    private int taskId;
    private int companyId;
    private int evaluatedCompanyId;
    private double score;
    private Integer supplyRateScore;
    private Integer deliveryTimeScore;
    private Integer passRateScore;
    private Integer dataAccuracy;
    private Integer productPackaging;
    private Integer productAppearance;
    private Integer customerServiceResponse;
    private Integer afterSalesService;
    private Integer communicationQuality;
    private Integer exceptionHandling;
    private Integer priceRating;
    private Integer documentCompleteness;
    private Integer transactionConvenience;
    private Integer transactionSecurity;
}

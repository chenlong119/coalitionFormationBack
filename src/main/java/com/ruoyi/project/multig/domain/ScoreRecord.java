package com.ruoyi.project.multig.domain;

import java.sql.Timestamp;
import lombok.Data;

@Data
public class ScoreRecord {
    private int id;
    private int companyId;
    private int taskId;
    private int evaluatedCompanyId;
    private double score;
    private Timestamp timestamp;
    private String name;
    private String companyname;
    private  Feedback feedback;
    private DeliveryFeedback deliveryFeedback;
    private ProductQualityFeedback productQualityFeedback; // 已经是 ProductQualityFeedback 类型
    private ServiceFeedback serviceFeedback;               // 更改为 ServiceFeedback 类型
    private TransactionFeedback transactionFeedback;       // 更改为 TransactionFeedback 类型

    // 其他属性和方法


}


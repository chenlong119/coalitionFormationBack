package com.ruoyi.project.multig.domain;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class Feedback {

    private int res1;
    private DeliveryFeedback deliveryFeedback;
    private ProductQualityFeedback productQualityFeedback; // 已经是 ProductQualityFeedback 类型
    private ServiceFeedback serviceFeedback;               // 更改为 ServiceFeedback 类型
    private TransactionFeedback transactionFeedback;       // 更改为 TransactionFeedback 类型
    // ...其他属性

}

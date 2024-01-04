package com.ruoyi.project.multig.domain;

public class Feedback {
    private DeliveryFeedback deliveryFeedback;
    private ProductQualityFeedback productQualityFeedback; // 已经是 ProductQualityFeedback 类型
    private ServiceFeedback serviceFeedback;               // 更改为 ServiceFeedback 类型
    private TransactionFeedback transactionFeedback;       // 更改为 TransactionFeedback 类型
    // ...其他属性

    // Getters 和 Setters
    public DeliveryFeedback getDeliveryFeedback() {
        return deliveryFeedback;
    }

    public void setDeliveryFeedback(DeliveryFeedback deliveryFeedback) {
        this.deliveryFeedback = deliveryFeedback;
    }

    public ProductQualityFeedback getProductQualityFeedback() {
        return productQualityFeedback;
    }

    public void setProductQualityFeedback(ProductQualityFeedback productQualityFeedback) {
        this.productQualityFeedback = productQualityFeedback;
    }

    public ServiceFeedback getServiceFeedback() {
        return serviceFeedback;
    }

    public void setServiceFeedback(ServiceFeedback serviceFeedback) {
        this.serviceFeedback = serviceFeedback;
    }

    public TransactionFeedback getTransactionFeedback() {
        return transactionFeedback;
    }

    public void setTransactionFeedback(TransactionFeedback transactionFeedback) {
        this.transactionFeedback = transactionFeedback;
    }

    // ...其他属性的Getters 和 Setters

    // toString 方法
    @Override
    public String toString() {
        return "Feedback{" +
                "deliveryFeedback='" + deliveryFeedback + '\'' +
                ", productQualityFeedback=" + productQualityFeedback +
                ", serviceFeedback=" + serviceFeedback +
                ", transactionFeedback=" + transactionFeedback +
                // ...其他属性
                '}';
    }
}

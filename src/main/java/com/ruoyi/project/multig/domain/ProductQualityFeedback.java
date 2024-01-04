package com.ruoyi.project.multig.domain;

public class ProductQualityFeedback {
    private Integer passRate;
    private Integer dataAccuracy;
    private Integer productPackaging;
    private Integer productAppearance;

    // Getters 和 Setters 方法
    public Integer getPassRate() {
        return passRate;
    }

    public void setQualityEvaluation(Integer passRate) {
        this.passRate = passRate;
    }

    public Integer getDataAccuracy() {
        return dataAccuracy;
    }

    public void setDataAccuracy(Integer dataAccuracy) {
        this.dataAccuracy = dataAccuracy;
    }

    public Integer getProductPackaging() {
        return productPackaging;
    }

    public void setProductPackaging(Integer productPackaging) {
        this.productPackaging = productPackaging;
    }

    public Integer getProductAppearance() {
        return productAppearance;
    }

    public void setProductAppearance(Integer productAppearance) {
        this.productAppearance = productAppearance;
    }

    // toString 方法
    @Override
    public String toString() {
        return "ProductQualityFeedback{" +
                "passRate=" + passRate +
                ", dataAccuracy=" + dataAccuracy +
                ", productPackaging=" + productPackaging +
                ", productAppearance=" + productAppearance +
                '}';
    }
}

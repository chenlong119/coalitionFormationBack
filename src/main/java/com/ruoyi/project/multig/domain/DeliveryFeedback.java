package com.ruoyi.project.multig.domain;
import java.util.Date;

public class DeliveryFeedback {
    private Integer supplyRate;
    private Integer deliveryTimeDifference;
    public Integer  getSupplyRate() {
        return supplyRate;
    }

    public void setSupplyRate(Integer  supplyRate) {
        this.supplyRate = supplyRate;
    }

    public Integer getDeliveryTimeDifference() {
        return deliveryTimeDifference;
    }

    public void setDeliveryTimeDifference(Integer deliveryTimeDifference) {
        this.deliveryTimeDifference = deliveryTimeDifference;
    }

    // toString 方法
    @Override
    public String toString() {
        return "DeliveryFeedback{" +

                ", supplyRate=" + supplyRate +
                ", deliveryTimeDifference=" + deliveryTimeDifference +
                '}';
    }
}

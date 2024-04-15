package com.ruoyi.project.multig.domain;
import lombok.Data;
@Data
public class ServiceFeedback {
    private Integer customerServiceResponse;
    private Integer afterSalesService;
    private Integer communicationQuality;
    private Integer exceptionHandling;

    public Integer getCustomerServiceResponse() {
        return customerServiceResponse;
    }

    public void setCustomerServiceResponse(Integer customerServiceResponse) {
        this.customerServiceResponse = customerServiceResponse;
    }

    public Integer getAfterSalesService() {
        return afterSalesService;
    }

    public void setAfterSalesService(Integer afterSalesService) {
        this.afterSalesService = afterSalesService;
    }

    public Integer getCommunicationQuality() {
        return communicationQuality;
    }

    public void setCommunicationQuality(Integer communicationQuality) {
        this.communicationQuality = communicationQuality;
    }

    public Integer getExceptionHandling() {
        return exceptionHandling;
    }

    public void setExceptionHandling(Integer exceptionHandling) {
        this.exceptionHandling = exceptionHandling;
    }

    @Override
    public String toString() {
        return "ServiceFeedback{" +
                "customerServiceResponse=" + customerServiceResponse +
                ", afterSalesService=" + afterSalesService +
                ", communicationQuality=" + communicationQuality +
                ", exceptionHandling=" + exceptionHandling +
                '}';
    }
}

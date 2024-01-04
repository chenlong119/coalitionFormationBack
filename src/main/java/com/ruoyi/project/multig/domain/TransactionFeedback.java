package com.ruoyi.project.multig.domain;

public class TransactionFeedback {
    private Integer priceRating;
    private Integer documentCompleteness;
    private Integer transactionConvenience;
    private Integer transactionSecurity;

    public Integer getPriceRating() {
        return priceRating;
    }

    public void setPriceRating(Integer priceRating) {
        this.priceRating = priceRating;
    }

    public Integer getDocumentCompleteness() {
        return documentCompleteness;
    }

    public void setDocumentCompleteness(Integer documentCompleteness) {
        this.documentCompleteness = documentCompleteness;
    }

    public Integer getTransactionConvenience() {
        return transactionConvenience;
    }

    public void setTransactionConvenience(Integer transactionConvenience) {
        this.transactionConvenience = transactionConvenience;
    }

    public Integer getTransactionSecurity() {
        return transactionSecurity;
    }

    public void setTransactionSecurity(Integer transactionSecurity) {
        this.transactionSecurity = transactionSecurity;
    }

    @Override
    public String toString() {
        return "TransactionFeedback{" +
                "priceRating=" + priceRating +
                ", documentCompleteness=" + documentCompleteness +
                ", transactionConvenience=" + transactionConvenience +
                ", transactionSecurity=" + transactionSecurity +
                '}';
    }
}

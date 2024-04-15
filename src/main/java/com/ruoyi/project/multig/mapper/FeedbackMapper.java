package com.ruoyi.project.multig.mapper;

import com.ruoyi.project.multig.domain.Feedback;
import com.ruoyi.project.multig.domain.FeedbackAttributes;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface FeedbackMapper {

    @Update("UPDATE score_records_sxz " +
            "SET " +
            "supplyRateScore = #{deliveryFeedback.supplyRateScore}, " +
            "deliveryTimeScore = #{deliveryFeedback.deliveryTimeScore}, " +
            "dataAccuracy = #{productQualityFeedback.dataAccuracy}, " +
            "passRateScore = #{productQualityFeedback.passRateScore}, " +
            "productAppearance = #{productQualityFeedback.productAppearance}, " +
            "productPackaging = #{productQualityFeedback.productPackaging}, " +
            "documentCompleteness = #{transactionFeedback.documentCompleteness}, " +
            "afterSalesService = #{serviceFeedback.afterSalesService}, " +
            "communicationQuality = #{serviceFeedback.communicationQuality}, " +
            "customerServiceResponse = #{serviceFeedback.customerServiceResponse}, " +
            "exceptionHandling = #{serviceFeedback.exceptionHandling}, " +
            "priceRating = #{transactionFeedback.priceRating}, " +
            "transactionConvenience = #{transactionFeedback.transactionConvenience}, " +
            "transactionSecurity = #{transactionFeedback.transactionSecurity} " +
            "WHERE id = #{res1}")
    void updateFeedback(Feedback feedback);

    @Select("SELECT task_id, company_id, evaluated_company_id, supplyRateScore, " +
            "deliveryTimeScore, dataAccuracy, passRateScore, productAppearance " +
            "productPackaging, documentCompleteness, afterSalesService, communicationQuality " +
            "customerServiceResponse, exceptionHandling, priceRating, transactionConvenience,transactionSecurity " +
            "FROM score_records_sxz")
    List<FeedbackAttributes> getAllFeedback();
}
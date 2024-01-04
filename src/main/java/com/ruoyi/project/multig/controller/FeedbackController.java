package com.ruoyi.project.multig.controller;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.ruoyi.project.multig.domain.Feedback;
import com.ruoyi.project.multig.service.FeedbackProcessingService; // 确保导入FeedbackProcessingService
import com.ruoyi.framework.web.domain.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("/multig/feedback")

public class FeedbackController {
    private static final Logger logger = LoggerFactory.getLogger(FeedbackController.class);
    private final FeedbackProcessingService feedbackProcessingService;

    // 使用@Autowired注解确保Spring注入FeedbackProcessingService
    @Autowired
    public FeedbackController(FeedbackProcessingService feedbackProcessingService) {
        this.feedbackProcessingService = feedbackProcessingService;
    }


    @PostMapping("/submit")
    public AjaxResult submitFeedback(@RequestBody Feedback feedback) {
        logger.info("Received feedback: {}", feedback);

        // 获取处理结果
        List<Double> satisfactionResults = feedbackProcessingService.processFeedback(feedback);

        // 将结果包装在 AjaxResult 中
        return AjaxResult.success("Feedback processed successfully.", satisfactionResults);
    }
    }



package com.ruoyi.project.multig.service;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.project.multig.domain.Feedback;
import com.ruoyi.project.multig.mapper.FeedbackMapper;
import com.ruoyi.project.multig.service.ScoreRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FeedbackService {

    @Autowired
    private ScoreRecordService scoreRecordService;

    @Autowired
    private FeedbackMapper feedbackMapper;

    public void saveFeedback(Feedback feedback) {
        feedbackMapper.updateFeedback(feedback);
    }

}

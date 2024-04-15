package com.ruoyi.project.multig.service;

import com.ruoyi.project.multig.domain.TaskCompanyInfo;
import com.ruoyi.project.multig.mapper.TaskCompanyInfoMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TaskCompanyInfoService {

    private static final Logger log = LoggerFactory.getLogger(TaskCompanyInfoService.class);
    private final TaskCompanyInfoMapper taskCompanyInfoMapper;

    @Autowired
    public TaskCompanyInfoService(TaskCompanyInfoMapper taskCompanyInfoMapper) {
        this.taskCompanyInfoMapper = taskCompanyInfoMapper;
    }

    public TaskCompanyInfo getTaskCompanyInfo(Long taskId, Long companyId) {
        log.info("Fetching TaskCompanyInfo with taskId: {} and companyId: {}", taskId, companyId);
        TaskCompanyInfo info = taskCompanyInfoMapper.selectByTaskIdAndCompanyId(taskId, companyId);
        if (info != null) {
            log.info("Found TaskCompanyInfo: {}", info);
        } else {
            log.warn("No TaskCompanyInfo found for taskId: {} and companyId: {}", taskId, companyId);
        }
        return info;
    }
}

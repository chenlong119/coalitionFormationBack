package com.ruoyi.project.multimode.service.impl;

import com.ruoyi.project.multimode.mapper.TasklistMapper;
import com.ruoyi.project.multimode.service.TasklistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service
public class TasklistServiceImpl implements TasklistService {
    private static final Logger logger = LoggerFactory.getLogger(TasklistServiceImpl.class);

    @Autowired
    private TasklistMapper tasklistMapper;

    @Override
    public String getTaskNameById(Integer taskId) {
        logger.info("Fetching task name for taskId: {}", taskId);
        try {
            String taskName = tasklistMapper.findTaskNameById(taskId);
            logger.info("Task name found: {}", taskName);
            return taskName;
        } catch (Exception e) {
            logger.error("Error fetching task name for taskId: {}", taskId, e);
            throw e; // Re-throwing the exception to let the controller handle it
        }

        //return tasklistMapper.findTaskNameById(taskId);
    }
}

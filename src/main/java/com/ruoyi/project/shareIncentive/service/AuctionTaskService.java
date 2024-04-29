package com.ruoyi.project.shareIncentive.service;

import com.ruoyi.project.shareIncentive.domain.AuctionTask;

import java.util.List;

public interface AuctionTaskService {
    List<AuctionTask> getAllTasks();

    List<AuctionTask> getTaskByState(String taskState);

    void addTask(AuctionTask task);

    void updateTask(AuctionTask task);

    void deleteTask(String taskName);
}
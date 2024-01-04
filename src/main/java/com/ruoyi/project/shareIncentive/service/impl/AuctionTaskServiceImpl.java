package com.ruoyi.project.shareIncentive.service.impl;

import com.ruoyi.project.shareIncentive.domain.AuctionTask;
import com.ruoyi.project.shareIncentive.mapper.AuctionTaskMapper;
import com.ruoyi.project.shareIncentive.service.AuctionTaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AuctionTaskServiceImpl implements AuctionTaskService {
    private final AuctionTaskMapper auctionTaskMapper;

    @Autowired
    public AuctionTaskServiceImpl(AuctionTaskMapper auctionTaskMapper) {
        this.auctionTaskMapper = auctionTaskMapper;
    }

    @Override
    public List<AuctionTask> getAllTasks() {
//        System.out.println(auctionTaskMapper.getAllTasks().get(1).getDataProviders());
        return auctionTaskMapper.getAllTasks();
    }

    @Override
    public List<AuctionTask> getTaskByState(String taskState) {
        return auctionTaskMapper.getTaskByState(taskState);
    }

    @Override
    public void addTask(AuctionTask task) {
        auctionTaskMapper.addTask(task);
    }

    @Override
    public void updateTask(AuctionTask task) {
        auctionTaskMapper.updateTask(task);
    }

    @Override
    public void deleteTask(String taskName) {
        auctionTaskMapper.deleteTask(taskName);
    }
}

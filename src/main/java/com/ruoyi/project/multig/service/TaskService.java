package com.ruoyi.project.multig.service;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.project.multig.domain.MutigTask;
import com.ruoyi.project.multig.mapper.MutigTaskMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TaskService {

    private final MutigTaskMapper taskMapper;

    @Autowired
    public TaskService(MutigTaskMapper taskMapper) {
        this.taskMapper = taskMapper;
    }

    public List<MutigTask> selectAllTasks() {
        int currentUserId =1 /*SecurityUtils.getUserId().intValue()*/;
        return taskMapper.selectAllTasks(currentUserId);
    }

}

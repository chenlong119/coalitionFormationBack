package com.ruoyi.project.multig.service;

import com.ruoyi.project.multig.domain.MutigTask;
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

    public List<MutigTask> getAllTasks() {
        return taskMapper.selectAllTasks();
    }
}

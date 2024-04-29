package com.ruoyi.project.coalitionformation.service;

import com.ruoyi.project.coalitionformation.entity.Resource;

import java.util.List;

public interface CoalitionTaskService {
    Integer allocate(Integer taskId, List<Resource> resourceList);
}

package com.ruoyi.project.coalitionformation.service;

import com.ruoyi.project.generate.company.domain.CompanyAll;

import java.util.List;

public interface UserCenterService {
    List<CompanyAll> getUserInfo();

    void updateTaskStatus(Integer taskId,Integer coalitionId);
}

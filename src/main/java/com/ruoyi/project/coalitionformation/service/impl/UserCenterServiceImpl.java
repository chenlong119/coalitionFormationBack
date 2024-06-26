package com.ruoyi.project.coalitionformation.service.impl;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.project.coalitionformation.mapper.CoalitionTaskMapper;
import com.ruoyi.project.coalitionformation.mapper.UserCenterMapper;
import com.ruoyi.project.coalitionformation.service.UserCenterService;
import com.ruoyi.project.generate.company.domain.CompanyAll;
import com.ruoyi.project.multimode.mapper.TaskAllMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserCenterServiceImpl implements UserCenterService {
    @Autowired private UserCenterMapper userCenterMapper;
    @Autowired private CoalitionTaskMapper coalitionTaskMapper;
    @Autowired private TaskAllMapper taskAllMapper;
    @Override
    public List<CompanyAll> getUserInfo() {
//        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//        LoginUser userLogin = (LoginUser) authentication.getPrincipal();
//        return  userCenterMapper.getUserInfo(userLogin.getUserId());
        return  userCenterMapper.getUserInfo(SecurityUtils.getUserId());
    }

    @Transactional
    @Override
    public void updateTaskStatus(Integer taskId, Integer coalitionId) {
        taskAllMapper.updateTaskStatus(taskId);
        coalitionTaskMapper.updateCoalitionStatus(coalitionId);
        //更新联盟中所有企业的状态为1
        coalitionTaskMapper.updateCoalitionCompanyStatus(coalitionId);
    }
}

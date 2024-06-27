package com.ruoyi.project.coalitionformation.controller;

import com.ruoyi.project.coalitionformation.service.UserCenterService;
import com.ruoyi.project.generate.company.domain.CompanyAll;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/userCenter")
public class UserCenterController {

    @Autowired private UserCenterService userCenterService;
    @GetMapping("/getUserInfo")
    public List<CompanyAll> getUserInfo() {
        return userCenterService.getUserInfo();
    }

    @GetMapping("/updateTaskStatus")
    public void updateTaskStatus(Integer taskId,Integer coalitionId)
    {
         userCenterService.updateTaskStatus(taskId,coalitionId);
    }
}

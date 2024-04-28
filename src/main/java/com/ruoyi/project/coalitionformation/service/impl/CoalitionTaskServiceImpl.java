package com.ruoyi.project.coalitionformation.service.impl;

import com.ruoyi.project.coalitionformation.entity.Coalition;
import com.ruoyi.project.coalitionformation.entity.Resource;
import com.ruoyi.project.coalitionformation.mapper.CoalitionTaskMapper;
import com.ruoyi.project.coalitionformation.service.CoalitionTaskService;
import com.ruoyi.project.generate.company.domain.CompanyAll;
import com.ruoyi.project.generate.company.service.ICompanyAllService;
import com.ruoyi.project.generate.taskcoalition.domain.TaskAll;
import com.ruoyi.project.generate.taskcoalition.service.ITaskAllService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

@Service
public class CoalitionTaskServiceImpl implements CoalitionTaskService
{
    @Autowired
    ICompanyAllService companyAllService;
    @Autowired
    CoalitionTaskMapper coalitionTaskMapper;
    @Autowired
    ITaskAllService taskAllService;
    @Transactional
    @Override
    public Integer allocate(Integer taskId, List<Resource> resourceList) {
        List<CompanyAll> selectedCompany = companyAllService.getCompanyByResource(resourceList);
        Coalition coalition = new Coalition();
        coalition.setCreateTime(LocalDateTime.now());
        coalition.setTaskId(taskId);
        coalitionTaskMapper.addCoalition(coalition);
        Integer coalitionId = coalition.getId();
        coalition.setName("联盟"+ coalitionId);
        coalitionTaskMapper.updateCoalition(coalition);
        for(CompanyAll company:selectedCompany) {
            company.setCoalitionId(coalitionId);
            company.setStatus(2);
            companyAllService.updateCompanyAll(company);
        }
        TaskAll task = new TaskAll();
        task.setId(taskId);
        task.setCoalitionId(coalitionId);
        task.setCoalitionTime(new Date());
        task.setTaskStatus(1);
        taskAllService.updateTaskAll(task);
        return coalitionId;
    }
}

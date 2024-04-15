package com.ruoyi.project.multimode.service.impl;

import com.ruoyi.project.multimode.domain.Coalition;
import com.ruoyi.project.multimode.domain.CoalitionCompany;
import com.ruoyi.project.multimode.mapper.CoalitionCompanyMapper;
import com.ruoyi.project.multimode.mapper.CoalitionMapper;
import com.ruoyi.project.multimode.service.TaskProcessingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class TaskProcessingServiceImpl implements TaskProcessingService {

    @Autowired
    private CoalitionMapper coalitionMapper;

    @Autowired
    private CoalitionCompanyMapper coalitionCompanyMapper;

    @Override
    public void processTaskAllocationResult(Integer taskId, List<Integer> machinesForJob, Integer mode) {
        // Step 1: 更新旧的coalition记录状态
        coalitionMapper.updateCoalitionStatusByTaskId(taskId, 0); // 假设0表示'异常'

        // Step 2: 创建新的coalition记录
        Coalition newCoalition = new Coalition();
        newCoalition.setName("Generated Name"); // You might want to generate or define a name
        newCoalition.setTaskId(taskId);
        newCoalition.setCreateTime(LocalDateTime.now());
        newCoalition.setCoalitionStatus(1); // 假设1表示'工作'
        newCoalition.setMode(mode);
        coalitionMapper.insertCoalition(newCoalition);

        // Assuming the ID is auto-generated and correctly set after insertion
        Integer newCoalitionId = newCoalition.getId();

        // Step 3: 为每个完成企业创建coalition_company记录
        machinesForJob.forEach(companyId -> {
            CoalitionCompany company = new CoalitionCompany();
            company.setCoalitionId(newCoalitionId);
            company.setCompanyId(companyId);
            // Set other fields as required
            coalitionCompanyMapper.insertCoalitionCompany(company);
        });
    }
}

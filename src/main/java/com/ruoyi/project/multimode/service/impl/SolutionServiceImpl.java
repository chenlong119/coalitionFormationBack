package com.ruoyi.project.multimode.service.impl;

import com.ruoyi.project.multimode.domain.Coalition;
import com.ruoyi.project.multimode.domain.CoalitionCompany;
import com.ruoyi.project.multimode.domain.Solution;
import com.ruoyi.project.multimode.mapper.CoalitionMapper;
import com.ruoyi.project.multimode.service.SolutionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;

@Service
public class SolutionServiceImpl implements SolutionService {

    @Autowired
    private CoalitionMapper coalitionMapper;

    @Transactional
    @Override
    public void processSolution(Solution solution) {
        // 将原有coalition的状态设置为0
        coalitionMapper.updateCoalitionStatusByTaskId(solution.getTaskId(), 0);

        // 创建新的Coalition
        Coalition newCoalition = new Coalition();
        newCoalition.setTaskId(solution.getTaskId());
        newCoalition.setName("新联盟" + solution.getTaskId()); // 示例名称
        newCoalition.setCreateTime(LocalDateTime.now());
        newCoalition.setCoalitionStatus(1);
        newCoalition.setMode(1); // 示例模式，根据实际情况调整
        coalitionMapper.insertCoalition(newCoalition);

        // 获取最后插入的Coalition的ID
        Integer newCoalitionId = coalitionMapper.selectLastInsertedId();

        // 为每个公司创建CoalitionCompany记录
        solution.getCompanyId().forEach(companyId -> {
            CoalitionCompany cc = new CoalitionCompany();
            cc.setCoalitionId(newCoalitionId); // 设置联盟ID
            cc.setCompanyId(companyId); // 设置公司ID
            cc.setDateTime(LocalDateTime.now()); // 示例日期，根据实际情况调整
            coalitionMapper.insertCoalitionCompany(cc);

        });
    }
}

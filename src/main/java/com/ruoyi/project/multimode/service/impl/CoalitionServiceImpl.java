package com.ruoyi.project.multimode.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.multimode.mapper.CoalitionMapper;
import com.ruoyi.project.multimode.mapper.CoalitionCompanyMapper;
import com.ruoyi.project.multimode.service.CoalitionService;
import com.ruoyi.project.multimode.domain.CoalitionDetails;
import java.util.List;
import java.util.Map;

@Service
public class CoalitionServiceImpl implements CoalitionService {

    @Autowired
    private CoalitionMapper coalitionMapper;

    @Autowired
    private CoalitionCompanyMapper coalitionCompanyMapper;

    @Override
    public List<CoalitionDetails> selectCoalitionDetails() {
        return coalitionMapper.selectCoalitionDetails();
    }

    @Override
    public List<CoalitionDetails> searchCoalitionByCriteria(Integer coalitionId, Integer taskId, String coalitionName, String modeName) {
        return coalitionMapper.searchCoalitionByCriteria(coalitionId, taskId, coalitionName, modeName);
    }
}

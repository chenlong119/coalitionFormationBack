package com.ruoyi.project.multimode.service.impl;

import com.ruoyi.project.multimode.service.BusinessHistoryService;
import org.springframework.stereotype.Service;
import java.util.List;
import com.ruoyi.project.multimode.domain.BusinessHistory;
import com.ruoyi.project.multimode.mapper.BusinessHistoryMapper;

@Service
public class BusinessHistoryServiceImpl implements BusinessHistoryService {

    private final BusinessHistoryMapper businessHistoryMapper;

    public BusinessHistoryServiceImpl(BusinessHistoryMapper businessHistoryMapper) {
        this.businessHistoryMapper = businessHistoryMapper;
    }

    @Override
    public List<BusinessHistory> findAll() {
        return businessHistoryMapper.findAll();
    }

    @Override
    public List<BusinessHistory> findByHistoryId(String id) {
        return businessHistoryMapper.findByHistoryId(id);
    }
}


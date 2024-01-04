package com.ruoyi.project.multimode.service.impl;

import com.ruoyi.project.multimode.domain.BusinessLocation;
import com.ruoyi.project.multimode.mapper.BusinessLocationMapper;
import com.ruoyi.project.multimode.service.BusinessLocationService;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class BusinessLocationServiceImpl implements BusinessLocationService {

    private final BusinessLocationMapper businessLocationMapper;

    public BusinessLocationServiceImpl(BusinessLocationMapper businessLocationMapper) {
        this.businessLocationMapper = businessLocationMapper;
    }

    @Override
    public List<BusinessLocation> findAll() {
        return businessLocationMapper.findAll();
    }
}
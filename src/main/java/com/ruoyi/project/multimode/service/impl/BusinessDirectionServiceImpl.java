package com.ruoyi.project.multimode.service.impl;

import com.ruoyi.project.multimode.service.BusinessDirectionService;
import org.springframework.stereotype.Service;
import java.util.List;
import com.ruoyi.project.multimode.domain.BusinessDirection;
import com.ruoyi.project.multimode.mapper.BusinessDirectionMapper;

@Service
public class BusinessDirectionServiceImpl implements BusinessDirectionService {

    private final BusinessDirectionMapper businessDirectionMapper;

    public BusinessDirectionServiceImpl(BusinessDirectionMapper businessDirectionMapper) {
        this.businessDirectionMapper = businessDirectionMapper;
    }

    @Override
    public List<BusinessDirection> findAll() {
        return businessDirectionMapper.findAll();
    }
}

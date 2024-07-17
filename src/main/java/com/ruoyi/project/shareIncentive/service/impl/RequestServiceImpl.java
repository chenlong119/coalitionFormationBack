package com.ruoyi.project.shareIncentive.service.impl;



import com.ruoyi.project.shareIncentive.domain.CompanyIncomeDto;
import com.ruoyi.project.shareIncentive.domain.Request;
import com.ruoyi.project.shareIncentive.mapper.RequestMapper;
import com.ruoyi.project.shareIncentive.service.RequestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

// UserServiceImpl.java (Service层的实现)
@Service
public class RequestServiceImpl implements RequestService {

    @Autowired
    private RequestMapper requestMapper;

    @Override
    public void addDataSharingRequest(Request request) {
        requestMapper.insertDataSharingRequest(request);
    }

    @Override
    public List<Request> getAllDataSharingRequests() {
        return requestMapper.findAll();
    }

    @Override
    public void finishRequest(Integer id){requestMapper.setFinished(id);}

    @Override
    public void updateCompanyIncome(CompanyIncomeDto companyIncomeDto) {
        requestMapper.updateCompanyIncome(companyIncomeDto);
    }

    ;



}


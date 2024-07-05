package com.ruoyi.project.shareIncentive.service;


import com.ruoyi.project.shareIncentive.domain.CompanyIncomeDto;
import com.ruoyi.project.shareIncentive.domain.Request;

import java.util.List;

// UserService.java (Service层)
public interface RequestService {
    void addDataSharingRequest(Request request);
    List<Request> getAllDataSharingRequests();

    void finishRequest(Integer id);

    void updateCompanyIncome(CompanyIncomeDto companyIncomeDto);
}
package com.ruoyi.project.income.service;

import com.ruoyi.project.income.domain.CompanyIncome;
import com.ruoyi.project.income.domain.GraphLinkDTO;
import com.ruoyi.project.income.domain.GraphNodeDTO;

import java.util.List;
import java.util.Map;

public interface IncomeService {

    List<CompanyIncome> getAllCompany();

    List<Map<String, Object>> getRelatedCompany(int companyId);

    CompanyIncome getCompanyById(int companyId);

    List<GraphNodeDTO> getAllNode();

    List<GraphLinkDTO> getAllLink();
}

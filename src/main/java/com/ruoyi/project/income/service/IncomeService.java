package com.ruoyi.project.income.service;

//import com.ruoyi.project.income.domain.CompanyIncome;
import com.ruoyi.project.income.dto.CompanyUser;
import com.ruoyi.project.income.dto.GraphLinkDTO;
import com.ruoyi.project.income.dto.GraphNodeDTO;
import com.ruoyi.project.income.dto.IncomeDTO;

import java.util.List;
import java.util.Map;

public interface IncomeService {

    List<IncomeDTO> getAllCompany();

    List<Map<String, Object>> getRelatedCompany(int companyId);

    IncomeDTO getCompanyById(int companyId);

    List<GraphNodeDTO> getAllNode();

    List<GraphLinkDTO> getAllLink();

    CompanyUser getCompanyNow(String username);
}

package com.ruoyi.project.income.mapper;


import com.ruoyi.project.income.domain.CompanyIncome;
import com.ruoyi.project.income.domain.GraphLinkDTO;
import com.ruoyi.project.income.domain.GraphNodeDTO;
import com.ruoyi.project.income.domain.RelatedCompanyDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IncomeMapper {

    public List<CompanyIncome> queryAll();

    public List<RelatedCompanyDTO> queryRelatedCompany(int companyId);

    public CompanyIncome queryCompanyById(int companyId);

    public List<GraphNodeDTO> queryAllNode();

    public List<GraphLinkDTO> queryAllLink();
}

package com.ruoyi.project.income.mapper;


//import com.ruoyi.project.income.domain.*;
import com.ruoyi.project.income.dto.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IncomeMapper {

    public List<IncomeDTO> queryAll();

    public IncomeDTO queryCompanyById(int companyId);

    public List<RelatedCompanyDTO> queryRelatedCompany(int companyId);

    public List<GraphNodeDTO> queryAllNode();

    public List<GraphLinkDTO> queryAllLink();

    public CompanyUser queryCompanyNow(String username);
}

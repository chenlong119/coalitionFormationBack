package com.ruoyi.project.shareIncentive.mapper;

import com.ruoyi.project.shareIncentive.domain.CompanyIncomeDto;
import com.ruoyi.project.shareIncentive.domain.Request;

import java.util.List;

public interface RequestMapper {
//    @Insert("INSERT INTO dataSharingRequests (name, description, industry_chain, data_type, target_companies) " +
//            "VALUES (#{name}, #{description}, #{industryChain}, #{dataType}, #{targetCompanies})")
    void insertDataSharingRequest(Request request);
//    @Select("SELECT * FROM dataSharingRequests")
    List<Request> findAll();

    void setFinished(Integer id);

    void updateCompanyIncome(CompanyIncomeDto companyIncomeDto);
}

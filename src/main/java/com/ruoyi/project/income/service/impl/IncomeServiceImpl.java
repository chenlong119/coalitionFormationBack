package com.ruoyi.project.income.service.impl;

import com.ruoyi.project.income.domain.CompanyIncome;
import com.ruoyi.project.income.domain.GraphLinkDTO;
import com.ruoyi.project.income.domain.GraphNodeDTO;
import com.ruoyi.project.income.domain.RelatedCompanyDTO;
import com.ruoyi.project.income.mapper.IncomeMapper;
import com.ruoyi.project.income.service.IncomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class IncomeServiceImpl implements IncomeService {

    @Autowired
    private IncomeMapper incomeMapper;

    /**
     * 获取所有企业信息
     */
    public List<CompanyIncome> getAllCompany(){
        List<CompanyIncome> companyList = new ArrayList<>();
        companyList = incomeMapper.queryAll();
        return companyList;
    }

    /**
     * 根据id查询企业收益信息
     */
    public CompanyIncome getCompanyById(int companyId){
        CompanyIncome companyIncome = null;
        companyIncome = incomeMapper.queryCompanyById(companyId);
        return companyIncome;
    }

    /**
     * 根据id获取关联企业列表
     */
    public List<Map<String, Object>> getRelatedCompany(int companyId){
        List<RelatedCompanyDTO> relatedCompanyList = new ArrayList<>();
        List<Map<String, Object>> resultList = new ArrayList<>();
        relatedCompanyList = incomeMapper.queryRelatedCompany(companyId);
        for (RelatedCompanyDTO relatedCompany : relatedCompanyList) {
            Map<String, Object> relatedCompanyMap = new HashMap<>();
            relatedCompanyMap.put("companyId", relatedCompany.getCompanyId());
            relatedCompanyMap.put("name", relatedCompany.getName());
            relatedCompanyMap.put("field", relatedCompany.getField());
            relatedCompanyMap.put("category", relatedCompany.getCategory());
            relatedCompanyMap.put("marketShare", relatedCompany.getMarketShare());
            relatedCompanyMap.put("marketIncrease", relatedCompany.getMarketIncrease());
            relatedCompanyMap.put("turnover", relatedCompany.getTurnover());
            relatedCompanyMap.put("deliveryRate", relatedCompany.getDeliveryRate());
            relatedCompanyMap.put("earningsRate", relatedCompany.getEarningsRate());
            relatedCompanyMap.put("averageRoi", relatedCompany.getAverageRoi());
            relatedCompanyMap.put("liability", relatedCompany.getLiability());
            relatedCompanyMap.put("ownerEquity", relatedCompany.getOwnerEquity());
            relatedCompanyMap.put("isSupply", relatedCompany.getIsSupply());
            relatedCompanyMap.put("isCooperation", relatedCompany.getIsCooperation());
            relatedCompanyMap.put("isCompetition", relatedCompany.getIsCompetition());
            relatedCompanyMap.put("totalRelation", relatedCompany.getTotalRelation());
            relatedCompanyMap.put("analysis", relatedCompany.getAnalysis());
            resultList.add(relatedCompanyMap);
        }
        return resultList;
    }


    /**
     * 获取关系图中所有节点
     */
    public List<GraphNodeDTO> getAllNode(){
        List<GraphNodeDTO> NodeList = new ArrayList<>();
        NodeList = incomeMapper.queryAllNode();
        return NodeList;
    }

    /**
     * 获取关系图中所有连接
     */
    public List<GraphLinkDTO> getAllLink(){
        List<GraphLinkDTO> LinkList = new ArrayList<>();
        LinkList = incomeMapper.queryAllLink();
        return LinkList;
    }



}

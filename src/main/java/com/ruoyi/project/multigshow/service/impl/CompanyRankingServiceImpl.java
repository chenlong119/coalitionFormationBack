package com.ruoyi.project.multigshow.service.impl;

import com.ruoyi.project.multigshow.domain.CompanyRanking;
import com.ruoyi.project.multigshow.mapper.CompanyRankingMapper;
import com.ruoyi.project.multigshow.service.ICompanyRankingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class CompanyRankingServiceImpl implements ICompanyRankingService {

    @Autowired
    private CompanyRankingMapper companyRankingMapper;

    @Override
    public List<CompanyRanking> selectCompanyRankingList() {
        return companyRankingMapper.selectCompanyRankingList();
    }
    // 其他业务方法的实现...
}

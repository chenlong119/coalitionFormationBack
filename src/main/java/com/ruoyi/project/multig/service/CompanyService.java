package com.ruoyi.project.multig.service;

import com.ruoyi.project.multig.domain.Company;
import com.ruoyi.project.multig.mapper.CompanyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class CompanyService {

    private final CompanyMapper companyMapper;

    @Autowired
    public CompanyService(CompanyMapper companyMapper) {
        this.companyMapper = companyMapper;
    }

    // ... 其他已有的方法 ...

    // 根据任务ID获取企业列表
    public List<Company> getCompaniesByTaskId(Long taskId) {
        return companyMapper.selectCompaniesByTaskId(taskId);
    }
}

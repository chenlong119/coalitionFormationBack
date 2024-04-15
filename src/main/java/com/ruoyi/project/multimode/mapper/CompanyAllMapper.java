package com.ruoyi.project.multimode.mapper;
import com.ruoyi.project.multimode.domain.CompanyAll2;
import java.util.List;

import org.springframework.stereotype.Component;

@Component("companyAllMapper2")
public interface CompanyAllMapper {
    List<CompanyAll2> selectAllCompanies();
    //根据公司id查询公司名称
    String findCompanyNameById(Integer companyId);
}

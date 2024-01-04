package com.ruoyi.project.multig.mapper;

import com.ruoyi.project.multig.domain.Company;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import java.util.List;

public interface CompanyMapper {

    // ... 其他已有的方法 ...

    // 根据任务ID查询相关联的企业
    List<Company> selectCompaniesByTaskId(@Param("taskId") Long taskId);
}

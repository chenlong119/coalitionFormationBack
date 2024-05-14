package com.ruoyi.project.multig.mapper;

import com.ruoyi.project.multig.domain.Company;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface CompanyMapper {
    List<Company> selectCompaniesByTaskId(@Param("taskId") Long taskId, int userId);
}

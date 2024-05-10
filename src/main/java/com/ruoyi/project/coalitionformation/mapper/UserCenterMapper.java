package com.ruoyi.project.coalitionformation.mapper;

import com.ruoyi.project.generate.company.domain.CompanyAll;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface UserCenterMapper {

    @Select("select * from `ry-vue`.company_all where id=#{userId} ")
    List<CompanyAll> getUserInfo(Long userId);
}

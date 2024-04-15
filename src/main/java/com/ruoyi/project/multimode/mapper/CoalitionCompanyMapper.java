package com.ruoyi.project.multimode.mapper;
import com.ruoyi.project.multimode.domain.CoalitionCompany;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CoalitionCompanyMapper {
    void insertCoalitionCompany(CoalitionCompany coalitionCompany);
}

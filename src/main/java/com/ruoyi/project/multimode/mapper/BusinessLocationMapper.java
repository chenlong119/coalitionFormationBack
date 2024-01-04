package com.ruoyi.project.multimode.mapper;

import com.ruoyi.project.multimode.domain.BusinessLocation;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import java.util.List;

@Mapper
public interface BusinessLocationMapper {

    List<BusinessLocation> findAll();
}

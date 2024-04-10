package com.ruoyi.project.coalitionformation.mapper;

import com.ruoyi.project.coalitionformation.entity.Resource;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ResourceMapper {
  List<Resource> getCompanyResource(Integer companyId, Integer layerId);

  List<Resource> getTaskResource(Integer taskId);
}

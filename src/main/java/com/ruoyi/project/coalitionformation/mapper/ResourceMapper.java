package com.ruoyi.project.coalitionformation.mapper;

import com.ruoyi.project.coalitionformation.entity.Resource;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ResourceMapper {
  List<Resource> getCompanyResource(Integer companyId, Integer layerId);

  List<Resource> getTaskResource(Integer taskId);

  @Select("select * from resource_all where id = #{id}")
  @Results({
    @Result(property = "id", column = "id"),
    @Result(property = "name", column = "name"),
  })
  Resource getone(Integer id);

  void updateTaskResource(Integer task_id, Resource resource);

  void updateCompanyResource(Integer company_id, Integer layerId, Resource resource);

  void deleteTaskResource(Integer task_id, Integer resource_id);

  void deleteCompanyResource(Integer company_id, Integer layerId, Integer resource_id);

  void insertTaskResource(Integer task_id, Resource resource);

  void insertCompanyResource(Integer company_id, Integer layerId, Resource resource);
}

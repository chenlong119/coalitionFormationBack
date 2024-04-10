package com.ruoyi.project.coalitionformation.mapper;

import com.ruoyi.project.coalitionformation.entity.CompanyEdge;
import com.ruoyi.project.coalitionformation.entity.CompanyNode;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface GraphMapper {
  @Select("select  id, name, rep,layer_id from company_all")
  @Results({
    @Result(property = "id", column = "id"),
    @Result(property = "name", column = "name"),
    @Result(property = "layer_id", column = "layer_id"),
    @Result(property = "value", column = "rep")
  })
  public List<CompanyNode> getNodes();

  @Select("select  company1_id ,company2_id, weight,layer_id from multiplex_relationship")
  @Results({
    @Result(property = "source", column = "company1_id"),
    @Result(property = "target", column = "company2_id"),
    @Result(property = "weight", column = "weight"),
    @Result(property = "layer", column = "layer_id")
  })
  List<CompanyEdge> getEdges();
}

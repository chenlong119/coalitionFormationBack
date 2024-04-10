package com.ruoyi.project.coalitionformation.mapper;

import com.ruoyi.project.coalitionformation.entity.CompanyEdge;
import com.ruoyi.project.coalitionformation.entity.CompanyNode;
import java.util.List;
import org.apache.ibatis.annotations.*;

@Mapper
public interface GraphMapper {
  @Select("select  id, name, rep,layer_id, group_id from company_all")
  @Results({
    @Result(property = "id", column = "id"),
    @Result(property = "name", column = "name"),
    @Result(property = "layer_id", column = "layer_id"),
    @Result(property = "value", column = "rep"),
    @Result(property = "category", column = "group_id")
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

  @Insert(
      "insert into multiplex_relationship(company1_id,company2_id,weight,layer_id) values(#{id1},#{id2},1,#{layer})")
  void addRelation(Integer id1, Integer id2, Integer layer);
}

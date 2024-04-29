package com.ruoyi.project.coalitionformation.mapper;

import com.ruoyi.project.coalitionformation.entity.CompanyEdge;
import com.ruoyi.project.coalitionformation.entity.CompanyNode;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface GraphMapper {
  @Select("select  id, name, rep,layer_id, coalition_id from company_all where company_type=#{companyType}")
  @Results({
    @Result(property = "id", column = "id"),
    @Result(property = "name", column = "name"),
    @Result(property = "layer_id", column = "layer_id"),
    @Result(property = "value", column = "rep"),
    @Result(property = "category", column = "coalition_id")
  })
  public List<CompanyNode> getNodes(Integer companyType);

  @Select("select  company1_id ,company2_id, weight,layer_id from multiplex_relationship where link_type=#{linkType}")
  @Results({
    @Result(property = "source", column = "company1_id"),
    @Result(property = "target", column = "company2_id"),
    @Result(property = "weight", column = "weight"),
    @Result(property = "layer", column = "layer_id")
  })
  List<CompanyEdge> getEdges(Integer linkType);

  @Insert(
      "insert into multiplex_relationship(company1_id,company2_id,layer_id,link_type) values(#{id1},#{id2},#{layer},#{companyType})")
  void addRelation(Integer id1, Integer id2, Integer layer,Integer companyType);
}

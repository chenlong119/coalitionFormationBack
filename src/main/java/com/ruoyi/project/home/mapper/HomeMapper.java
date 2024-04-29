package com.ruoyi.project.home.mapper;

import com.ruoyi.project.home.entity.HomeLink;
import com.ruoyi.project.home.entity.HomeNode;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface HomeMapper {

    @Select("select  id, name, layer_id, company_type, chain_name from company_all")
    @Results({
            @Result(property = "id", column = "id"),
            @Result(property = "name", column = "name"),
            @Result(property = "layer_id", column = "layer_id"),
            @Result(property = "company_type", column = "company_type"),
            @Result(property = "chain_name", column = "chain_name")
    })
    List<HomeNode> getHomeNodes();


    @Select("select company1_id, company2_id, layer_id, weight, strength from multiplex_relationship")
    @Results({
            @Result(property = "source", column = "company1_id"),
            @Result(property = "target", column = "company2_id"),
            @Result(property = "layer", column = "layer_id"),
            @Result(property = "weight", column = "weight"),
            @Result(property = "strength", column = "strength"),
    })
    List<HomeLink> getHomeLinks();
}

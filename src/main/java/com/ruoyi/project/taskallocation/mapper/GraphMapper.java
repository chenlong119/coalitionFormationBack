package com.ruoyi.project.taskallocation.mapper;

import com.ruoyi.project.taskallocation.domain.Business;
import java.util.List;
import org.apache.ibatis.annotations.Select;

public interface GraphMapper {

  @Select("select * from `ry-vue`.business;")
  List<Business> getNodes();

  @Select("select name from `ry-vue`.business where id = #{id};")
  String getBusnissNameById(int id);
}

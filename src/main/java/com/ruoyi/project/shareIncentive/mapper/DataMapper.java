package com.ruoyi.project.shareIncentive.mapper;

import com.ruoyi.project.shareIncentive.domain.Bid;
import com.ruoyi.project.shareIncentive.domain.Data;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface DataMapper {
//    @Select("select * from `ry-vue`.bid where BidID = #{id};")
    Data findById (Long id);
//    @Select("select * from `ry-vue`.bid;")
    List<Data> findAll();
    Data selectIng (Long status);

 }

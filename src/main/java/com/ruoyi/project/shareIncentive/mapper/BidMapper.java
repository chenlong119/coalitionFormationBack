package com.ruoyi.project.shareIncentive.mapper;

import com.ruoyi.project.shareIncentive.domain.Bid;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface BidMapper {
//    @Select("select * from `ry-vue`.bid where BidID = #{id};")
    Bid findById ( String id);
//    @Select("select * from `ry-vue`.bid;")
    List<Bid> findAll();
    Bid findLatestBidAmount(Integer id);
}


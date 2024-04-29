package com.ruoyi.project.shareIncentive.mapper;

import com.ruoyi.project.shareIncentive.domain.AuctionRecord;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface AuctionMapper {

    @Select("select * from `ry-vue`.auction_record where RecordID = #{id};")
    AuctionRecord findById(Long id);
    @Select("select * from `ry-vue`.auction_record;")
    List<AuctionRecord> findAll();
    void add(AuctionRecord auctionrecord);

}

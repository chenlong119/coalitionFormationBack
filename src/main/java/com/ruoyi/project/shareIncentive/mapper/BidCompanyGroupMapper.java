package com.ruoyi.project.shareIncentive.mapper;

import com.ruoyi.project.shareIncentive.domain.BidCompanyGroup;

import java.util.List;

public interface BidCompanyGroupMapper {
    List<BidCompanyGroup> getAll();
//    BidCompanyGroup findById(Integer id);
    void add(BidCompanyGroup bidCompanyGroup);
    List<BidCompanyGroup> getByAuctionId(Integer id);
    void setSelected(Integer id);

}

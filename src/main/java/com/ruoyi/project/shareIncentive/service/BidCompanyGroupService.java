package com.ruoyi.project.shareIncentive.service;

import com.ruoyi.project.shareIncentive.domain.BidCompanyGroup;

import java.util.List;

public interface BidCompanyGroupService {
    public abstract List<BidCompanyGroup> getAll();

    void add(BidCompanyGroup bidCompanyGroup);

    List<BidCompanyGroup> getByAuctionId(Integer id);

    void setSelected(Integer id);
}

package com.ruoyi.project.shareIncentive.service;

import com.ruoyi.project.shareIncentive.domain.AuctionTask;
import com.ruoyi.project.shareIncentive.domain.CompanyGroupFormingAuction;

import java.util.List;

public interface CompanyGroupFormingAuctionService {
    List<CompanyGroupFormingAuction> getAll();

    List<CompanyGroupFormingAuction> getByReleaser(String name);
    List<CompanyGroupFormingAuction> getByNameBid(String name);

    void add(CompanyGroupFormingAuction task);

    void update(CompanyGroupFormingAuction task);

    void delete(String taskName);

}

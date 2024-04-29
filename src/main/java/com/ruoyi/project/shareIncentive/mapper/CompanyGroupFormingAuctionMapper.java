package com.ruoyi.project.shareIncentive.mapper;
import com.ruoyi.project.shareIncentive.domain.AuctionTask;
import com.ruoyi.project.shareIncentive.domain.CompanyGroupFormingAuction;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
public interface CompanyGroupFormingAuctionMapper {
    List<CompanyGroupFormingAuction> getAll();

    List<CompanyGroupFormingAuction> getByReleaser( String name);
    List<CompanyGroupFormingAuction> getByUsernameBid( String name);

    void add(CompanyGroupFormingAuction task);


    void update(CompanyGroupFormingAuction task);


    void delete(String taskName);
}

package com.ruoyi.project.shareIncentive.service.impl;

import com.ruoyi.project.shareIncentive.domain.CompanyGroupFormingAuction;
import com.ruoyi.project.shareIncentive.mapper.CompanyGroupFormingAuctionMapper;
import com.ruoyi.project.shareIncentive.service.CompanyGroupFormingAuctionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CompanyGroupFormingAuctionServiceImpl implements CompanyGroupFormingAuctionService {
   @Autowired
    private  CompanyGroupFormingAuctionMapper companyGroupFormingAuctionMapper;
@Override
    public List<CompanyGroupFormingAuction> getAll(){
    return companyGroupFormingAuctionMapper.getAll();
}

@Override
public  List<CompanyGroupFormingAuction> getByReleaser(String name){
    return companyGroupFormingAuctionMapper.getByReleaser(name);}

    @Override
    public List<CompanyGroupFormingAuction> getByNameBid(String name) {
        return companyGroupFormingAuctionMapper.getByUsernameBid(name);
    }

    @Override
    public void add(CompanyGroupFormingAuction task){
    companyGroupFormingAuctionMapper.add(task);
}

    @Override
    public void update(CompanyGroupFormingAuction task) {
        companyGroupFormingAuctionMapper.update(task);
    }

    @Override
    public  void delete(String name){
    companyGroupFormingAuctionMapper.delete(name);
    }
}

package com.ruoyi.project.shareIncentive.service.impl;

import com.ruoyi.project.shareIncentive.domain.BidCompanyGroup;
import com.ruoyi.project.shareIncentive.mapper.BidCompanyGroupMapper;
import com.ruoyi.project.shareIncentive.service.BidCompanyGroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BidCompanyGroupServiceImpl implements BidCompanyGroupService {
    @Autowired
    private BidCompanyGroupMapper bidCompanyGroupMapper;
    @Override
    public List<BidCompanyGroup> getAll(){
        return bidCompanyGroupMapper.getAll();
    }
    @Override
    public void add(BidCompanyGroup bidCompanyGroup){
        bidCompanyGroupMapper.add(bidCompanyGroup);
    }
    @Override
    public  List<BidCompanyGroup> getByAuctionId(Integer id){
        return bidCompanyGroupMapper.getByAuctionId(id);
    }

    @Override
    public void setSelected(Integer id){ bidCompanyGroupMapper.setSelected(id);}
}

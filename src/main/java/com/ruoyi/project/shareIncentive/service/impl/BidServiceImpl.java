package com.ruoyi.project.shareIncentive.service.impl;

import com.ruoyi.project.shareIncentive.domain.Bid;
import com.ruoyi.project.shareIncentive.mapper.BidMapper;
import com.ruoyi.project.shareIncentive.service.BidService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BidServiceImpl implements BidService {
    @Autowired
    private BidMapper bidMapper;

    @Override
    public Bid getBidById(String id){
        return bidMapper.findById(id);
    }
    @Override
    public List<Bid> getAllBids(){
        System.out.println(bidMapper.findAll());
        return bidMapper.findAll();
    }
}

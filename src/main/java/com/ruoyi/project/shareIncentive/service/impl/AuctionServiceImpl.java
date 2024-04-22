package com.ruoyi.project.shareIncentive.service.impl;

import com.ruoyi.project.shareIncentive.domain.AuctionRecord;
import com.ruoyi.project.shareIncentive.mapper.AuctionMapper;
import com.ruoyi.project.shareIncentive.service.AuctionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
@Service
public class AuctionServiceImpl implements AuctionService {
    @Autowired
    private AuctionMapper auctionMapper;
    @Override
    public AuctionRecord getAuctionRecordById(Long id){
         return auctionMapper.findById(id);
     }
     @Override
    public List<AuctionRecord> getAllAuctionRecord(){
        return auctionMapper.findAll();
     }

     @Override
     public void addAuctionRecord(AuctionRecord auctionRecord) {
         auctionMapper.add(auctionRecord);
     }

}

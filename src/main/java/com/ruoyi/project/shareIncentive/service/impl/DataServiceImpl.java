package com.ruoyi.project.shareIncentive.service.impl;

import com.ruoyi.project.shareIncentive.domain.AuctionRecord;
import com.ruoyi.project.shareIncentive.domain.Bid;
import com.ruoyi.project.shareIncentive.domain.Data;
import com.ruoyi.project.shareIncentive.mapper.AuctionMapper;
import com.ruoyi.project.shareIncentive.mapper.BidMapper;
import com.ruoyi.project.shareIncentive.mapper.DataMapper;
import com.ruoyi.project.shareIncentive.service.DataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class DataServiceImpl implements DataService {
    @Autowired
    private DataMapper dataMapper;

    @Autowired
    private BidMapper bidMapper;

    @Autowired
    private AuctionMapper auctionMapper;
    @Override
    public Data getDataById(Long id){
        return dataMapper.findById(id);
    }
    @Override
    public List<Data> getAllData(){
        return dataMapper.findAll();
    }
    @Override
    public List<Data> selectIng(Long sta){
        return (List<Data>) dataMapper.selectIng(sta);}
    @Override
    public void updateNewBid(){
        List<Data> dataList=selectIng(Long.valueOf("进行中"));
//        List<String> dataName;
//        针对每一个data中的dataName，在bid表中查找他的最新日期的报价并给出那条数
        for (Data data : dataList) {
            Integer dataId = Math.toIntExact(data.getDataID());
            String latestBidAmount = String.valueOf(findLatestBidAmount(dataId).getBidAmount());
            Integer winnerId = Math.toIntExact(findLatestBidAmount(dataId).getUserID());
            LocalDateTime time = findLatestBidAmount(dataId).getBidTime();

            // 更新 Data 表中的最新报价字段等
            AuctionRecord auctionRecord = new AuctionRecord();
            auctionRecord.setUserID(Long.valueOf(winnerId));
            auctionRecord.setDataID(String.valueOf(dataId));
            auctionRecord.setAuctionTime(time);
            auctionRecord.setWinningPrice(latestBidAmount);
            auctionRecord.setStatus("成功");



            // 将拍卖成功的信息插入到 AuctionTask 表中
            auctionMapper.add(auctionRecord);
        }
//        addTemp();
    }

    @Override
    public Bid findLatestBidAmount(Integer id) {
        return bidMapper.findLatestBidAmount(id);

    }

    @Override
    public void addTemp(){
        AuctionRecord auctionRecord = new AuctionRecord();
        auctionRecord.setUserID(Long.valueOf("3"));
        auctionRecord.setDataID("104");
        auctionRecord.setAuctionTime(LocalDateTime.parse("2023-12-14 16:28:47"));
        auctionRecord.setWinningPrice("15");
        auctionRecord.setStatus("成功");


        // 将拍卖成功的信息插入到 AuctionTask 表中
        auctionMapper.add(auctionRecord);
    }

}

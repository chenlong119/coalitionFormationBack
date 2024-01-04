package com.ruoyi.project.shareIncentive.service;

import com.ruoyi.project.shareIncentive.domain.AuctionRecord;

import java.util.List;

public interface AuctionService {

    AuctionRecord getAuctionRecordById(Long id);

    List<AuctionRecord> getAllAuctionRecord();

    void addAuctionRecord(AuctionRecord auctionRecord);
}

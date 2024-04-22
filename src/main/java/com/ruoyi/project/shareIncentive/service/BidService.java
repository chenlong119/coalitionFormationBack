package com.ruoyi.project.shareIncentive.service;

import com.ruoyi.project.shareIncentive.domain.Bid;

import java.util.List;

public interface BidService {

    Bid getBidById(String id);

    List<Bid> getAllBids();
}

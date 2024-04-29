package com.ruoyi.project.shareIncentive.service;

import com.ruoyi.project.shareIncentive.domain.Bid;
import com.ruoyi.project.shareIncentive.domain.Data;

import java.util.List;

public interface DataService {
    Data getDataById(Long id);

    List<Data> getAllData();

    List<Data> selectIng(Long sta);

    void updateNewBid();

    Bid findLatestBidAmount(Integer id);

    void addTemp();

}

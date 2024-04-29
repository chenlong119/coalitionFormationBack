package com.ruoyi.project.shareIncentive.service;

import com.ruoyi.project.shareIncentive.domain.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

public abstract class AuctionSettlementService {

    public abstract List<Data> selectIng(Long sta);
}

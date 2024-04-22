package com.ruoyi.project.shareIncentive.contoller;

import com.ruoyi.project.shareIncentive.domain.AuctionRecord;
import com.ruoyi.project.shareIncentive.service.AuctionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/auction")
public class AuctionController {
    @Autowired
    private AuctionService auctionService;

    @GetMapping("/{auctionId}")
    public ResponseEntity<AuctionRecord> getAuctionRecordById(@PathVariable Long auctionId){
        AuctionRecord auctionRecord = auctionService.getAuctionRecordById(auctionId);
        return ResponseEntity.ok(auctionRecord);
    }




}

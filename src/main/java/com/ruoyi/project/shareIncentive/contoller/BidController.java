package com.ruoyi.project.shareIncentive.contoller;

import com.ruoyi.project.shareIncentive.domain.Bid;
import com.ruoyi.project.shareIncentive.service.BidService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/bid")
public class BidController {
    @Autowired
    private BidService bidService;
    @GetMapping("/{bidId}")
    public ResponseEntity<Bid> getBidById(@PathVariable String bidId){
        Bid bid = bidService.getBidById(bidId);
        return ResponseEntity.ok(bid);
    }
//    @GetMapping("/all")
//    public ResponseEntity<List<Bid>> getAllBids(){
//        List<Bid> bids = bidService.getAllBids();
//        System.out.println("bids: "+bids);
//        return  ResponseEntity.ok(bids);
//    }
    @GetMapping("/all")
    public List<Bid> getAllBids(){
        List<Bid> bids = bidService.getAllBids();
        System.out.println("bids: "+bids);
        return  bids;

    }

}

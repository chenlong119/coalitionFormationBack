package com.ruoyi.project.shareIncentive.contoller;

import com.ruoyi.project.shareIncentive.domain.BidCompanyGroup;
import com.ruoyi.project.shareIncentive.service.BidCompanyGroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;

@RestController
//@RequestMapping("/companyGroupFormingAuction")
@RequestMapping("/bidGroup")
public class BidCompanyGroupController {
    @Autowired
    public BidCompanyGroupService bidCompanyGroupService;

    @GetMapping("/getByAuctionId")
    public List<BidCompanyGroup> getByAuctionId(Integer id){
        return bidCompanyGroupService.getByAuctionId(id);
    }
    @GetMapping("/all")
    public List<BidCompanyGroup> getAll(){
        List<BidCompanyGroup> bids = bidCompanyGroupService.getAll();
        return bids;
    }
    @PostMapping("/add")
    public void add(@RequestBody BidCompanyGroup bidCompanyGroup){
        System.out.println("controller   USERNAME"+bidCompanyGroup.getUserName());
        LocalDateTime currentDate  = LocalDateTime.now();
        bidCompanyGroup.setBidTime(currentDate);
        bidCompanyGroupService.add(bidCompanyGroup);
    }


    @GetMapping("/selectBid/{id}")
    public void selectId(@PathVariable Integer id){

    bidCompanyGroupService.setSelected(id);
    }
}

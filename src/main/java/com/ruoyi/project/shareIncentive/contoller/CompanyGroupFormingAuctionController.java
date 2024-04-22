package com.ruoyi.project.shareIncentive.contoller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.project.shareIncentive.domain.CompanyGroupFormingAuction;
import com.ruoyi.project.shareIncentive.service.CompanyGroupFormingAuctionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
//@RequestMapping("/companyGroupFormingAuction")
@RequestMapping("/cgfa")
public class CompanyGroupFormingAuctionController {
    @Autowired
    public CompanyGroupFormingAuctionService companyGroupFormingAuctionService;
    @GetMapping("/all")
    public List<CompanyGroupFormingAuction> getAll(){
        List<CompanyGroupFormingAuction> auctions = companyGroupFormingAuctionService.getAll();
        return auctions;
    }

    @GetMapping("/getByReleaser/{name}")
    public List<CompanyGroupFormingAuction> getByReleaser(@PathVariable String name) {
        List<CompanyGroupFormingAuction> auctions =companyGroupFormingAuctionService.getByReleaser(name);
        return auctions;
    }

    @GetMapping("/getByNameBid/{name}")
    public List<CompanyGroupFormingAuction> getByNameBid(@PathVariable String name) {
        List<CompanyGroupFormingAuction> auctions =companyGroupFormingAuctionService.getByNameBid(name);
        return auctions;
    }

}

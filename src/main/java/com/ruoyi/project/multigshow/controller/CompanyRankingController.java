package com.ruoyi.project.multigshow.controller;

import com.ruoyi.project.multigshow.domain.CompanyRanking;
import com.ruoyi.project.multigshow.service.ICompanyRankingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/system/companyRanking")
public class CompanyRankingController {

    @Autowired
    private ICompanyRankingService companyRankingService;

    @GetMapping("/list")
    public List<CompanyRanking> list() {
        return companyRankingService.selectCompanyRankingList();
    }


}

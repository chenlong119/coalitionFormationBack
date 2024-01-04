package com.ruoyi.project.multigshow.controller;

import com.ruoyi.project.multigshow.domain.MultigshowEnterprise;
import com.ruoyi.project.multigshow.service.IEnterpriseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/multigshow/enterprise")
public class MultigshowEnterpriseController {

    @Autowired
    private IEnterpriseService enterpriseService;

    @GetMapping("/list")
    public List< MultigshowEnterprise> list() {
        List<MultigshowEnterprise> mlist= new ArrayList<>();
        mlist=enterpriseService.selectEnterpriseList();
        for(MultigshowEnterprise multigshowEnterprise:mlist){
            System.out.println("multigshowEnterprise:"+multigshowEnterprise);
        }

        return mlist;
    }
}

package com.ruoyi.project.multigshow.controller;

import com.ruoyi.project.multigshow.domain.MultigshowEnterprise;
import com.ruoyi.project.multigshow.service.IEnterpriseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import static com.ruoyi.framework.datasource.DynamicDataSourceContextHolder.log;


@RestController
@RequestMapping("/multigshow/enterprise")
public class MultigshowEnterpriseController {

    @Autowired
    private IEnterpriseService enterpriseService;
    @GetMapping("/list")
    public ResponseEntity<List<MultigshowEnterprise>> list() {
        try {
            List<MultigshowEnterprise> mlist = enterpriseService.selectEnterpriseList();
            return ResponseEntity.ok(mlist);
        } catch (Exception e) {
            log.error("Failed to fetch enterprise list", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }


}

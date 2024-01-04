package com.ruoyi.project.multig.controller;

import com.ruoyi.project.multig.domain.Company;
import com.ruoyi.project.multig.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.ruoyi.framework.datasource.DynamicDataSourceContextHolder.log;

@RestController
@RequestMapping("/api/companies")
public class CompanyController {

    private final CompanyService companyService;

    @Autowired
    public CompanyController(CompanyService companyService) {
        this.companyService = companyService;
    }

    // ... 其他已有的端点 ...

    @GetMapping("/byTask")
    public ResponseEntity<List<Company>> getCompaniesByTaskId(@RequestParam("taskId") Long taskId) {
        log.info("Fetching companies for task ID: {}", taskId);
        List<Company> companies = companyService.getCompaniesByTaskId(taskId);
        log.info("ss:{}",companies);
        if (companies.isEmpty()) {
            log.info("No companies found for task ID: {}", taskId);
            // 可以选择返回空列表或错误信息
        }
        return ResponseEntity.ok(companies);
    }

}

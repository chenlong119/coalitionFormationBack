package com.ruoyi.project.dataFusion;

import com.mathworks.toolbox.javabuilder.MWException;

import com.ruoyi.project.dataFusion.service.CompanyService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;

@SpringBootTest
class CompanyControllerTest {

    @Autowired
    CompanyService companyService;

    @Test
    public void test() throws MWException {
        companyService.computeRelationStrengths();
    }
}
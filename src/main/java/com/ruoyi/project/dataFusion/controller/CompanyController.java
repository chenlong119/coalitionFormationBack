package com.ruoyi.project.dataFusion.controller;

import com.mathworks.toolbox.javabuilder.MWException;
import com.ruoyi.project.dataFusion.domain.CompanyDTO;
import com.ruoyi.project.dataFusion.domain.CompanyRelationDTO;
import com.ruoyi.project.dataFusion.domain.Group;
import com.ruoyi.project.dataFusion.service.CompanyService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Slf4j
@ResponseBody
@Component("companyController2")
@RequestMapping("/dataFusion")
public class CompanyController {
  @Autowired private CompanyService companyService;


  @GetMapping("/list")
  public CompanyDTO getAllCompaniesWithoutLocation() throws MWException {
    log.info("企业特征信息");
//    companyService.CompanyDa  taProcessor();
    return new CompanyDTO(companyService.getAllCompaniesWithoutLocation());
  }

  @GetMapping("/relation1")
  public CompanyRelationDTO getPartRelation() {
    log.info("企业节点信息");
    return new CompanyRelationDTO(companyService.getAllCompanies(), companyService.getAllLinks());
  }

  @GetMapping("/relation2")
  public CompanyRelationDTO getTotalRelation() {
    log.info("企业拓扑信息");
    return new CompanyRelationDTO(
        companyService.getAllCompaniesWithOverallLocation(), companyService.getOverallLinks());
  }

  @GetMapping("/cluster")
  public int[] getClusters() throws MWException {
    log.info("分类信息");
    return companyService.CompanyDataProcessor();
  }

  @GetMapping("/group")
  public List<Group> getGroupInfo() {
    return companyService.getGroupInfo();
  }

  @GetMapping("/searchByName")
  public CompanyDTO searchSingleByName(@RequestParam String name){
    return new CompanyDTO(companyService.searchSingleByName(name));
  }


}

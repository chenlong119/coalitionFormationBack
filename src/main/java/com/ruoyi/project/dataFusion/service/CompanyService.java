package com.ruoyi.project.dataFusion.service;

import com.mathworks.toolbox.javabuilder.MWException;
import com.ruoyi.project.dataFusion.domain.Assessment;
import com.ruoyi.project.dataFusion.domain.Company2;
import com.ruoyi.project.dataFusion.domain.Group;
import com.ruoyi.project.dataFusion.domain.Link;
import java.util.List;

public interface CompanyService {
  List<Company2> getAllCompanies();

  List<Company2> getAllCompaniesWithoutLocation();

  int[] CompanyDataProcessor() throws MWException;

  void computeRelationStrengths();

  List<Link> getAllLinks();

  List<Link> getOverallLinks();

  List<Company2> getAllCompaniesWithOverallLocation();

  List<Group> getGroupInfo();

  List<Company2> searchSingleByName(String name);

  int[] searchImportantNode();

  void createAssessment(Assessment assessment);

  List<Assessment> getAssessments();

  void deleteAssessment(Integer id);
}

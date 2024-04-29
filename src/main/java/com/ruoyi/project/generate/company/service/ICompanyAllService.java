package com.ruoyi.project.generate.company.service;

import com.ruoyi.project.coalitionformation.entity.Resource;
import com.ruoyi.project.generate.company.domain.CompanyAll;
import com.ruoyi.project.generate.company.domain.CompanyCoalition;

import java.util.List;

/**
 * 企业信息Service接口
 *
 * @author cl
 * @date 2024-04-02
 */
public interface ICompanyAllService {
  /**
   * 查询企业信息
   *
   * @param id 企业信息主键
   * @return 企业信息
   */
  public CompanyAll selectCompanyAllById(Long id, Long layerId);

  /**
   * 查询企业信息列表
   *
   * @param companyAll 企业信息
   * @return 企业信息集合
   */
  public List<CompanyAll> selectCompanyAllList(CompanyAll companyAll);

  /**
   * 新增企业信息
   *
   * @param companyAll 企业信息
   * @return 结果
   */
  public int insertCompanyAll(CompanyAll companyAll);

  /**
   * 修改企业信息
   *
   * @param companyAll 企业信息
   * @return 结果
   */
  public int updateCompanyAll(CompanyAll companyAll);

  /**
   * 批量删除企业信息
   *
   * @param ids 需要删除的企业信息主键集合
   * @return 结果
   */
  public int deleteCompanyAllByIds(Long[] ids);

  /**
   * 删除企业信息信息
   *
   * @param id 企业信息主键
   * @return 结果
   */
  public int deleteCompanyAllById(Long id);

  CompanyAll getOneCompany(Integer id, Integer layer);

  List<CompanyAll> getById(Integer id);

  List<String> getNamesByIds(String ids);

  List<CompanyAll> getCompanyByResource(List<Resource> resources,Integer taskType);

  List<CompanyCoalition> getCompanyByCoalition(Integer coalitionId);

    List<CompanyAll> getAllCompany();

  void insertCompanyCoalition(CompanyCoalition companyCoalition);

  List<CompanyCoalition> getallCoalition();
}

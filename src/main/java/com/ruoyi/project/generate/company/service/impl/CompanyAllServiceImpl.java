package com.ruoyi.project.generate.company.service.impl;

import com.ruoyi.project.generate.company.domain.CompanyAll;
import com.ruoyi.project.generate.company.mapper.CompanyAllMapper;
import com.ruoyi.project.generate.company.service.ICompanyAllService;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 企业信息Service业务层处理
 *
 * @author cl
 * @date 2024-04-02
 */
@Service
public class CompanyAllServiceImpl implements ICompanyAllService {
  @Autowired private CompanyAllMapper companyAllMapper;

  /**
   * 查询企业信息
   *
   * @param id 企业信息主键
   * @return 企业信息
   */
  @Override
  public CompanyAll selectCompanyAllById(Long id, Long layerId) {
    return companyAllMapper.selectCompanyAllById(id, layerId);
  }

  /**
   * 查询企业信息列表
   *
   * @param companyAll 企业信息
   * @return 企业信息
   */
  @Override
  public List<CompanyAll> selectCompanyAllList(CompanyAll companyAll) {
    List<CompanyAll> allList = companyAllMapper.selectCompanyAllList(companyAll);
    allList.stream()
        .forEach(
            company -> {
              String chainName =
                  companyAllMapper.getIndustryChainNameByLayerId(company.getLayerId());
              company.setChainName(chainName);
            });
    return allList;
  }

  /**
   * 新增企业信息
   *
   * @param companyAll 企业信息
   * @return 结果
   */
  @Override
  public int insertCompanyAll(CompanyAll companyAll) {
    return companyAllMapper.insertCompanyAll(companyAll);
  }

  /**
   * 修改企业信息
   *
   * @param companyAll 企业信息
   * @return 结果
   */
  @Override
  public int updateCompanyAll(CompanyAll companyAll) {
    return companyAllMapper.updateCompanyAll(companyAll);
  }

  /**
   * 批量删除企业信息
   *
   * @param ids 需要删除的企业信息主键
   * @return 结果
   */
  @Override
  public int deleteCompanyAllByIds(Long[] ids) {
    return companyAllMapper.deleteCompanyAllByIds(ids);
  }

  /**
   * 删除企业信息信息
   *
   * @param id 企业信息主键
   * @return 结果
   */
  @Override
  public int deleteCompanyAllById(Long id) {
    return companyAllMapper.deleteCompanyAllById(id);
  }

  @Override
  public CompanyAll getOneCompany(Integer id, Integer layer) {
    return companyAllMapper.getOneCompany(id, layer);
  }

  @Override
  public List<CompanyAll> getById(Integer id) {
    return companyAllMapper.getById(id);
  }

  @Override
  public List<String> getNamesByIds(String ids) {
    List<Integer> tmp = new ArrayList<>();
    for (String id : ids.split(",")) tmp.add(Integer.valueOf(id));
    return companyAllMapper.getNamesByIds(ids);
  }
}

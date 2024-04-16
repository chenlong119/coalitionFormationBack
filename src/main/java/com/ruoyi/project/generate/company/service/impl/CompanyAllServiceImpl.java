package com.ruoyi.project.generate.company.service.impl;

import com.ruoyi.project.coalitionformation.entity.Resource;
import com.ruoyi.project.coalitionformation.mapper.ResourceMapper;
import com.ruoyi.project.generate.company.domain.CompanyAll;
import com.ruoyi.project.generate.company.mapper.CompanyAllMapper;
import com.ruoyi.project.generate.company.service.ICompanyAllService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

/**
 * 企业信息Service业务层处理
 *
 * @author cl
 * @date 2024-04-02
 */
@Service
public class CompanyAllServiceImpl implements ICompanyAllService {
  @Autowired private CompanyAllMapper companyAllMapper;
  @Autowired private ResourceMapper resourceMapper;

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
    return companyAllMapper.getNamesByIds(tmp);
  }

  public boolean compareResource(Map<Integer,Integer> target, Map<Integer,Integer> cur )
  {
    Set<Integer> tmp=new HashSet<>();
    tmp.addAll(target.keySet());
    tmp.retainAll(cur.keySet());
    if(tmp.isEmpty())
      return false;
    for(Integer key:tmp)
    {
      target.put(key,target.get(key)-cur.get(key));
      if(target.get(key)<=0)
        target.remove(key);
    }
    return true;
  }

  @Override
  public List<CompanyAll> getCompanyByResource(List<Resource> resources) {
    Map<Integer, Integer> resourceMap = resources.stream().collect(Collectors.toMap(Resource::getId, Resource::getNum));
    List<CompanyAll> allIdleCompany = companyAllMapper.getAllIdleCompany();
    int size=allIdleCompany.size();
    List<CompanyAll> res=new ArrayList<>();
    Set<String> visited=new HashSet<>();
    while(!resourceMap.isEmpty())
    {
      int index=(int)(Math.random()*size);
      CompanyAll selectCompany = allIdleCompany.get(index);
      String key=selectCompany.getId()+" "+selectCompany.getLayerId();
      if(visited.contains(key))
      {
        continue;
      }
      visited.add(key);
      List<Resource> companyResource = resourceMapper.getCompanyResource(selectCompany.getId().intValue(), selectCompany.getLayerId().intValue());
      Map<Integer, Integer> companyResourceMap = companyResource.stream().collect(Collectors.toMap(Resource::getId, Resource::getNum));
      if(compareResource(resourceMap,companyResourceMap))
      {
        res.add(selectCompany);
      }
    }
    return res;
  }

  @Override
  public List<CompanyAll> getCompanyByCoalition(Long coalitionId) {
    return companyAllMapper.getCompanyByCoalition(coalitionId);
  }
}

package com.ruoyi.project.generate.company.service.impl;

import com.ruoyi.project.coalitionformation.entity.Resource;
import com.ruoyi.project.coalitionformation.mapper.ResourceMapper;
import com.ruoyi.project.generate.company.domain.CompanyAll;
import com.ruoyi.project.generate.company.domain.CompanyCoalition;
import com.ruoyi.project.generate.company.mapper.CompanyAllMapper;
import com.ruoyi.project.generate.company.service.ICompanyAllService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
    allList
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
    if(companyAll.getId()==null)
    {
      Integer maxId = companyAllMapper.getMaxId();
        companyAll.setId(maxId+1);
    }
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
  @Transactional
  public int deleteCompanyAllByIds(Long[] ids) {
    for(Long id:ids)
    {
      companyAllMapper.deleteCompanyRelation(id);
    }
    companyAllMapper.deleteCompanyResource(ids);
    return companyAllMapper.deleteCompanyAllByIds(ids);
  }

  /**
   * 删除企业信息信息
   *
   * @param id 企业信息主键
   * @return 结果
   */
  @Override
  @Transactional
  public int deleteCompanyAllById(Long id) {
    companyAllMapper.deleteCompanyRelation(id);
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

  private boolean reduceResource(Map<Integer,Integer> target, Map<Integer,Integer> cur )
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

  private boolean preCheck(Map<Integer, Integer> resourceMap, Map<Integer, Integer> allIdleCompanyResource) {
    Set<Integer> tmp=new HashSet<>();
    tmp.addAll(resourceMap.keySet());
    tmp.retainAll(allIdleCompanyResource.keySet());
    if(tmp.size()<resourceMap.size())
      return false;
    for(Integer key: tmp)
    {
      if(allIdleCompanyResource.get(key)<resourceMap.get(key))
        return false;
    }
    return true;
  }

  private Map<Integer,Integer> resourcelistToMap(List<Resource> resources)
  {
    Map<Integer,Integer> res=new HashMap<>();
    resources.forEach(resource -> {
      Integer resourceId = resource.getId();
      res.putIfAbsent(resourceId,0);
      res.put(resourceId,res.get(resourceId)+resource.getNum());
    });
    return res;
  }

  private double getSatisfyRate(Map<Integer,Integer> resourceMap, Map<Integer,Integer> companyResource)
  {
    double sum=0;
    for(Integer key:resourceMap.keySet())
    {
      if(companyResource.containsKey(key))
        sum+=Math.min(1,companyResource.get(key)*1.0/resourceMap.get(key));
    }
    return sum;
  }

  @Override
  public List<CompanyAll> getCompanyByResource(List<Resource> resources,Integer taskType) {
    Map<Integer, Integer> resourceMap = resources.stream().collect(Collectors.toMap(Resource::getId, Resource::getNum));
    List<CompanyAll> allIdleCompany = companyAllMapper.getAllIdleCompany(taskType);
    if(allIdleCompany.size()==0)
      return null;
    Map<Integer,Integer> allIdleCompanyResource=new HashMap<>();
    Map<String,Map<Integer,Integer>> memo=new HashMap<>();
    allIdleCompany.forEach(company->{
      List<Resource> companyResource = resourceMapper.getCompanyResource(company.getId(),company.getLayerId());
      String key=company.getId()+"_"+company.getLayerId();
      memo.put(key,resourcelistToMap(companyResource));
      companyResource.forEach(resource -> {
        Integer resourceId = resource.getId();
        allIdleCompanyResource.putIfAbsent(resourceId,0);
        allIdleCompanyResource.put(resourceId,allIdleCompanyResource.get(resourceId)+resource.getNum());
      });
    });
    boolean isSat=preCheck(resourceMap,allIdleCompanyResource);
    if(!isSat)
      return null;
    List<CompanyAll> res=new ArrayList<>();
    while(!resourceMap.isEmpty())
    {
//   按照满足度由大到小排序
        allIdleCompany.sort((o1, o2) -> {
          String k1=o1.getId()+"_"+o1.getLayerId();
            String k2=o2.getId()+"_"+o2.getLayerId();
            double rate1 = getSatisfyRate(resourceMap, memo.get(k1));
            double rate2 = getSatisfyRate(resourceMap, memo.get(k2));
            return Double.compare(rate2, rate1);
        });
        CompanyAll company = allIdleCompany.get(0);
        Map<Integer,Integer> companyResource=memo.get(company.getId()+"_"+company.getLayerId());
        if(reduceResource(resourceMap,companyResource))
        {
            res.add(company);
        }
        allIdleCompany.remove(0);
    }
    return res;
  }


  @Override
  public List<CompanyCoalition> getCompanyByCoalition(Integer coalitionId) {
    return companyAllMapper.getCompanyByCoalition(coalitionId);
  }

  @Override
  public List<CompanyAll> getAllCompany() {
    return companyAllMapper.getAllCompany();
  }

  @Override
  public void insertCompanyCoalition(CompanyCoalition companyCoalition) {
    companyAllMapper.insertCompanyCoalition(companyCoalition);
  }

  @Override
  public List<CompanyCoalition> getallCoalition() {
    return companyAllMapper.getAllCoalition();
  }
}

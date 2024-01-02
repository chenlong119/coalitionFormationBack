package com.ruoyi.project.taskallocation.service.impl;

import com.ruoyi.project.taskallocation.domain.Business;
import com.ruoyi.project.taskallocation.domain.NeighborDto;
import com.ruoyi.project.taskallocation.domain.Resource;
import com.ruoyi.project.taskallocation.domain.ResourceDto;
import com.ruoyi.project.taskallocation.mapper.BusinessMapper;
import com.ruoyi.project.taskallocation.service.IBusinessService;
import java.util.*;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 企业信息Service业务层处理
 *
 * @author cl
 * @date 2023-12-05
 */
@Service
public class BusinessServiceImpl implements IBusinessService {
  @Autowired private BusinessMapper businessMapper;

  /**
   * 查询企业信息
   *
   * @param id 企业信息主键
   * @return 企业信息
   */
  @Override
  public Business selectBusinessById(String id) {
    return businessMapper.selectBusinessById(id);
  }

  /**
   * 查询企业信息列表
   *
   * @param business 企业信息
   * @return 企业信息
   */
  @Override
  public List<Business> selectBusinessList(Business business) {
    return businessMapper.selectBusinessList(business);
  }

  /**
   * 新增企业信息
   *
   * @param business 企业信息
   * @return 结果
   */
  @Override
  public int insertBusiness(Business business) {
    return businessMapper.insertBusiness(business);
  }

  /**
   * 修改企业信息
   *
   * @param business 企业信息
   * @return 结果
   */
  @Override
  public int updateBusiness(Business business) {
    return businessMapper.updateBusiness(business);
  }

  /**
   * 批量删除企业信息
   *
   * @param ids 需要删除的企业信息主键
   * @return 结果
   */
  @Override
  public int deleteBusinessByIds(String[] ids) {
    return businessMapper.deleteBusinessByIds(ids);
  }

  /**
   * 删除企业信息信息
   *
   * @param id 企业信息主键
   * @return 结果
   */
  @Override
  public int deleteBusinessById(String id) {
    return businessMapper.deleteBusinessById(id);
  }

  @Override
  public Long selectTaskByBusinessId(Long id) {
    return businessMapper.getTask(id);
  }

  @Override
  public ResourceDto getResource(Long id, String type) {
    List<Resource> resources = null;
    if (type.equals("bus")) {
      resources = businessMapper.getResourceByBusId(id);
    } else {
      resources = businessMapper.getResourceByTaskId(id);
    }
    List<String> categories = resources.stream().map(r -> r.getName()).collect(Collectors.toList());
    List<Long> barData = resources.stream().map(r -> r.getNumber()).collect(Collectors.toList());
    List<Long> lineData =
        resources.stream()
            .map(
                r -> {
                  Long rId = r.getId();
                  return businessMapper.getResourceSumByResId(rId);
                })
            .collect(Collectors.toList());
    return new ResourceDto(categories, barData, lineData);
  }

  @Override
  public List<NeighborDto> getNeighbor(String kw) {
    List<NeighborDto> neighbor = businessMapper.getNeighbor(kw);
    // 去除neighbor中name重复的企业
    List<NeighborDto> res = new ArrayList<>();
    for (NeighborDto neighborDto : neighbor) {
      if (res.stream().noneMatch(n -> n.getName().equals(neighborDto.getName()))) {
        res.add(neighborDto);
      }
    }
    return res;
  }
}

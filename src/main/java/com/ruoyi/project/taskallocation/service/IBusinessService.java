package com.ruoyi.project.taskallocation.service;

import com.ruoyi.project.taskallocation.domain.Business;
import com.ruoyi.project.taskallocation.domain.NeighborDto;
import com.ruoyi.project.taskallocation.domain.ResourceDto;
import java.util.List;

/**
 * 企业信息Service接口
 *
 * @author cl
 * @date 2023-12-05
 */
public interface IBusinessService {
  /**
   * 查询企业信息
   *
   * @param id 企业信息主键
   * @return 企业信息
   */
  public Business selectBusinessById(String id);

  /**
   * 查询企业信息列表
   *
   * @param business 企业信息
   * @return 企业信息集合
   */
  public List<Business> selectBusinessList(Business business);

  /**
   * 新增企业信息
   *
   * @param business 企业信息
   * @return 结果
   */
  public int insertBusiness(Business business);

  /**
   * 修改企业信息
   *
   * @param business 企业信息
   * @return 结果
   */
  public int updateBusiness(Business business);

  /**
   * 批量删除企业信息
   *
   * @param ids 需要删除的企业信息主键集合
   * @return 结果
   */
  public int deleteBusinessByIds(String[] ids);

  /**
   * 删除企业信息信息
   *
   * @param id 企业信息主键
   * @return 结果
   */
  public int deleteBusinessById(String id);

  Long selectTaskByBusinessId(Long id);

  ResourceDto getResource(Long id, String type);

  List<NeighborDto> getNeighbor(String kw);
}

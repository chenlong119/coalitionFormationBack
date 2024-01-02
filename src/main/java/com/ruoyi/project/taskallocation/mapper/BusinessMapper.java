package com.ruoyi.project.taskallocation.mapper;

import com.ruoyi.project.taskallocation.domain.Business;
import com.ruoyi.project.taskallocation.domain.NeighborDto;
import com.ruoyi.project.taskallocation.domain.Resource;
import java.util.List;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

/**
 * 企业信息Mapper接口
 *
 * @author cl
 * @date 2023-12-05
 */
public interface BusinessMapper {
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
   * 删除企业信息
   *
   * @param id 企业信息主键
   * @return 结果
   */
  public int deleteBusinessById(String id);

  /**
   * 批量删除企业信息
   *
   * @param ids 需要删除的数据主键集合
   * @return 结果
   */
  public int deleteBusinessByIds(String[] ids);

  @Select("select task_id from task_business where bus_id = #{id}")
  Long getTask(Long id);

  @Select(
      "select r.*,rb.number from `ry-vue`.resource r inner join `ry-vue`.business_resource rb on r.id = rb.resource_id where rb.bus_id=#{id}")
  List<Resource> getResourceByBusId(Long id);

  /** 根据资源编号查询资源总量 */
  @Select("select sum(number) from `ry-vue`.business_resource where resource_id=#{id} ")
  Long getResourceSumByResId(Long id);

  @Select(
      "select r.*,tb.number from `ry-vue`.resource r inner join `ry-vue`.task_resource tb on r.id = tb.resource_id where tb.task_id=#{id}")
  List<Resource> getResourceByTaskId(Long id);

  /**
   * 查询所有名称包含关键字kw的企业
   *
   * @param kw
   * @return
   */
  @Select("select id,name from `ry-vue`.business where name like concat('%',#{kw},'%')")
  List<NeighborDto> getNeighbor(String kw);

  @Select("select * from `ry-vue`.business where state = 1")
  List<Business> getAllBusinessId();

  @Update("update `ry-vue`.business set task = 0,state = 1 where task = #{id}")
  void recoverBusinessCoalition(Long id);
}

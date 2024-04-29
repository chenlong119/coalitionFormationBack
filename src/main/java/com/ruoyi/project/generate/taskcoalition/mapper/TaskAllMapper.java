package com.ruoyi.project.generate.taskcoalition.mapper;

import com.ruoyi.project.generate.taskcoalition.domain.TaskAll;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 任务信息Mapper接口
 *
 * @author cl
 * @date 2024-04-10
 */
public interface TaskAllMapper {

  @Select("select  layer_id  from company_all where id=#{companyId}")
  List<Integer> getChainIdsByCompanyId(Integer companyId);

  @Select("select * from `ry-vue`.task_all where chain_id=#{chainId}")
  public List<TaskAll> getChainTask(Integer chainId);

  @Select("select * from `ry-vue`.task_all")
  public List<TaskAll> getAllTask();
  /**
   * 查询任务信息
   *
   * @param id 任务信息主键
   * @return 任务信息
   */
  public TaskAll selectTaskAllById(Long id);

  /**
   * 查询任务信息列表
   *
   * @param taskAll 任务信息
   * @return 任务信息集合
   */
  public List<TaskAll> selectTaskAllList(TaskAll taskAll);

  /**
   * 新增任务信息
   *
   * @param taskAll 任务信息
   * @return 结果
   */
  public int insertTaskAll(TaskAll taskAll);

  /**
   * 修改任务信息
   *
   * @param taskAll 任务信息
   * @return 结果
   */
  public int updateTaskAll(TaskAll taskAll);

  /**
   * 删除任务信息
   *
   * @param id 任务信息主键
   * @return 结果
   */
  public int deleteTaskAllById(Long id);

  /**
   * 批量删除任务信息
   *
   * @param ids 需要删除的数据主键集合
   * @return 结果
   */
  public int deleteTaskAllByIds(Long[] ids);

  @Select("select name from `ry-vue`.product where id=#{id} ")
  String getProductNameById(Integer id);

  @Select("select  * from `ry-vue`.task_all where id=#{id}")
  TaskAll getOne(Integer id);

  void deleteTaskResource(Long[] ids);
}

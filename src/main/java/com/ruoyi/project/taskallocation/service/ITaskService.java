package com.ruoyi.project.taskallocation.service;

import com.ruoyi.project.taskallocation.domain.Task;
import java.util.List;

/**
 * 系统任务管理Service接口
 *
 * @author cl
 * @date 2023-12-12
 */
public interface ITaskService {
  /**
   * 查询系统任务管理
   *
   * @param id 系统任务管理主键
   * @return 系统任务管理
   */
  public Task selectTaskById(Long id);

  /**
   * 查询系统任务管理列表
   *
   * @param task 系统任务管理
   * @return 系统任务管理集合
   */
  public List<Task> selectTaskList(Task task);

  /**
   * 新增系统任务管理
   *
   * @param task 系统任务管理
   * @return 结果
   */
  public int insertTask(Task task);

  /**
   * 修改系统任务管理
   *
   * @param task 系统任务管理
   * @return 结果
   */
  public int updateTask(Task task);

  /**
   * 批量删除系统任务管理
   *
   * @param ids 需要删除的系统任务管理主键集合
   * @return 结果
   */
  public int deleteTaskByIds(Long[] ids);

  /**
   * 删除系统任务管理信息
   *
   * @param id 系统任务管理主键
   * @return 结果
   */
  public int deleteTaskById(Long id);
}

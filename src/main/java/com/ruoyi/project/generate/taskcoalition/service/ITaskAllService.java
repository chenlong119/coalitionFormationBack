package com.ruoyi.project.generate.taskcoalition.service;

import com.ruoyi.project.generate.taskcoalition.domain.TaskAll;

import java.util.List;

/**
 * 任务信息Service接口
 *
 * @author cl
 * @date 2024-04-10
 */
public interface ITaskAllService {
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
   * 批量删除任务信息
   *
   * @param ids 需要删除的任务信息主键集合
   * @return 结果
   */
  public int deleteTaskAllByIds(Long[] ids);

  /**
   * 删除任务信息信息
   *
   * @param id 任务信息主键
   * @return 结果
   */
  public int deleteTaskAllById(Long id);

  String getProductNameById(Integer id);

  TaskAll getOne(Integer id);

  List<TaskAll> getAllTask();
}

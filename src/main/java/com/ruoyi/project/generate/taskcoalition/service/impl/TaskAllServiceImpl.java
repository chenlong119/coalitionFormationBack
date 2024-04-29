package com.ruoyi.project.generate.taskcoalition.service.impl;

import com.ruoyi.project.generate.taskcoalition.domain.TaskAll;
import com.ruoyi.project.generate.taskcoalition.mapper.TaskAllMapper;
import com.ruoyi.project.generate.taskcoalition.service.ITaskAllService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 任务信息Service业务层处理
 *
 * @author cl
 * @date 2024-04-10
 */
@Service
public class TaskAllServiceImpl implements ITaskAllService {
  @Autowired TaskAllMapper taskAllMapper;

  /**
   * 查询任务信息
   *
   * @param id 任务信息主键
   * @return 任务信息`
   */
  @Override
  public TaskAll selectTaskAllById(Long id) {
    return taskAllMapper.selectTaskAllById(id);
  }

  /**
   * 查询任务信息列表
   *
   * @param taskAll 任务信息
   * @return 任务信息
   */
  @Override
  public List<TaskAll> selectTaskAllList(TaskAll taskAll) {
    return taskAllMapper.selectTaskAllList(taskAll);
  }

  /**
   * 新增任务信息
   *
   * @param taskAll 任务信息
   * @return 结果
   */
  @Override
  public int insertTaskAll(TaskAll taskAll) {
    List<Integer> chainIds =
        taskAllMapper.getChainIdsByCompanyId(taskAll.getCompanyId());
    int random = (int) (Math.random() * chainIds.size() + 1);
    taskAll.setChainId(random);
    return taskAllMapper.insertTaskAll(taskAll);
  }

  /**
   * 修改任务信息
   *
   * @param taskAll 任务信息
   * @return 结果
   */
  @Override
  public int updateTaskAll(TaskAll taskAll) {
    return taskAllMapper.updateTaskAll(taskAll);
  }

  /**
   * 批量删除任务信息
   *
   * @param ids 需要删除的任务信息主键
   * @return 结果
   */
  @Override
  @Transactional
  public int deleteTaskAllByIds(Long[] ids) {
    taskAllMapper.deleteTaskResource(ids);
    return taskAllMapper.deleteTaskAllByIds(ids);
  }

  /**
   * 删除任务信息信息
   *
   * @param id 任务信息主键
   * @return 结果
   */
  @Override
  public int deleteTaskAllById(Long id) {
    return taskAllMapper.deleteTaskAllById(id);
  }

  @Override
  public String getProductNameById(Integer id) {
    return taskAllMapper.getProductNameById(id);
  }

  @Override
  public TaskAll getOne(Integer id) {
    return taskAllMapper.getOne(id);
  }

  @Override
  public List<TaskAll> getChainTask(Integer chainId) {
    return taskAllMapper.getChainTask(chainId);
  }

  @Override
  public List<TaskAll> getAllTask() {
    return taskAllMapper.getAllTask();
  }
}

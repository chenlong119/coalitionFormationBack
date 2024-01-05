package com.ruoyi.project.taskallocation.service.impl;

import com.ruoyi.framework.redis.RedisCache;
import com.ruoyi.project.taskallocation.domain.Business;
import com.ruoyi.project.taskallocation.domain.Task;
import com.ruoyi.project.taskallocation.mapper.BusinessMapper;
import com.ruoyi.project.taskallocation.mapper.TaskMapper;
import com.ruoyi.project.taskallocation.service.IBusinessService;
import com.ruoyi.project.taskallocation.service.ITaskService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 系统任务管理Service业务层处理
 *
 * @author cl
 * @date 2023-12-12
 */
@Service
public class TaskServiceImpl implements ITaskService {
  @Autowired private TaskMapper taskMapper;

  @Autowired IBusinessService businessService;
  @Autowired BusinessMapper businessMapper;
  @Autowired RedisCache redisCache;

  /**
   * 查询系统任务管理
   *
   * @param id 系统任务管理主键
   * @return 系统任务管理
   */
  @Override
  public Task selectTaskById(Long id) {
    return taskMapper.selectTaskById(id);
  }

  /**
   * 查询系统任务管理列表
   *
   * @param task 系统任务管理
   * @return 系统任务管理
   */
  @Override
  public List<Task> selectTaskList(Task task) {
    return taskMapper.selectTaskList(task);
  }

  /**
   * 新增系统任务管理
   *
   * @param task 系统任务管理
   * @return 结果
   */
  @Override
  public int insertTask(Task task) {
    List<Business> business = businessMapper.getAllBusinessId();
    // 获取当前任务数量
    Integer taskCount = taskMapper.getTaskCount();
    task.setId(taskCount.longValue() + 1);
    if (business.size() < 3) {
      task.setState(2L);
      taskMapper.insertTask(task);
      return 1;
    }
    int[] random = new int[3];
    for (int i = 0; i < 3; i++) {
      random[i] = (int) (Math.random() * business.size());
    }
    task.setState(1L);
    taskMapper.insertTask(task);
    for (int i = 0; i < 3; i++) {
      Business randomBusiness = business.get(random[i]);
      randomBusiness.setTask(task.getId());
      randomBusiness.setState(2L);
      businessMapper.updateBusiness(randomBusiness);
    }
    redisCache.setCacheObject("chy:loading", true);
    return 1;
  }

  /**
   * 修改系统任务管理
   *
   * @param task 系统任务管理
   * @return 结果
   */
  @Override
  public int updateTask(Task task) {
    return taskMapper.updateTask(task);
  }

  /**
   * 批量删除系统任务管理
   *
   * @param ids 需要删除的系统任务管理主键
   * @return 结果
   */
  @Override
  public int deleteTaskByIds(Long[] ids) {
    for (Long id : ids) {
      businessMapper.recoverBusinessCoalition(id);
    }
    List<Task> failTask = taskMapper.getFailTask();
    Long chooseId = null;
    int randomIndex = -1;
    if (failTask.size() > 0) {
      int random = (int) (Math.random() * failTask.size());
      Task task = failTask.get(random);
      chooseId = task.getId();
      randomIndex = random;
    }
    if (chooseId != null) {
      Long[] newids = new Long[ids.length + 1];
      for (int i = 0; i < ids.length; i++) {
        newids[i] = ids[i];
      }
      newids[ids.length] = chooseId;
      businessMapper.recoverBusinessCoalition(chooseId);
      taskMapper.deleteTaskByIds(newids);
      Task chooseTask = failTask.get(randomIndex);
      // 获取当前任务最大id
      Long maxId = taskMapper.getMaxId();
      chooseTask.setId(maxId + 1);
      insertTask(chooseTask);
      return 1;
    }
    redisCache.setCacheObject("chy:loading", true);
    return taskMapper.deleteTaskByIds(ids);
  }

  /**
   * 删除系统任务管理信息
   *
   * @param id 系统任务管理主键
   * @return 结果
   */
  @Override
  public int deleteTaskById(Long id) {
    return taskMapper.deleteTaskById(id);
  }
}

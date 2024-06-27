package com.ruoyi.project.multimode.mapper;

import com.ruoyi.project.multimode.domain.TaskAll2;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Component;

import java.util.List;

@Component("taskAllMapper2")
public interface TaskAllMapper {
    List<TaskAll2> selectActiveTasks();
    // 根据任务id查询任务名称
    String findTaskNameById(Integer taskId);

    @Update("update task_all set task_status=2 where id=#{taskId}  ")
    void updateTaskStatus(Integer taskId);
}

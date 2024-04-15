package com.ruoyi.project.multimode.mapper;

import com.ruoyi.project.multimode.domain.TaskAll2;
import java.util.List;

import org.springframework.stereotype.Component;

@Component("taskAllMapper2")
public interface TaskAllMapper {
    List<TaskAll2> selectActiveTasks();
    // 根据任务id查询任务名称
    String findTaskNameById(Integer taskId);
}

package com.ruoyi.project.multimode.mapper;

import com.ruoyi.project.multimode.domain.Tasklist;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TasklistMapper {
  List<Tasklist> findAll();

  int countTasklistById();

  String findTaskNameById(Integer taskId);
}

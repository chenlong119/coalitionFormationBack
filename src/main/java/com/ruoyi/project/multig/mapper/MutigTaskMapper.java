package com.ruoyi.project.multig.mapper;

import com.ruoyi.project.multig.domain.MutigTask;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface MutigTaskMapper {

    List<MutigTask> selectAllTasks();
}

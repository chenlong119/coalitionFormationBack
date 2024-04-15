package com.ruoyi.project.multig.mapper;
import com.ruoyi.project.multig.domain.MutigTask;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import com.ruoyi.project.multig.domain.MutigTask;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;



@Mapper
public interface MutigTaskMapper {


    List<MutigTask> selectAllTasks(@Param("userId") int userId);


}

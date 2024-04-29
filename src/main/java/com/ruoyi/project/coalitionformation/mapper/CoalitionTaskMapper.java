package com.ruoyi.project.coalitionformation.mapper;

import com.ruoyi.project.coalitionformation.entity.Coalition;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Update;

public interface CoalitionTaskMapper {

    @Insert("insert into `ry-vue`.coalition(task_id, create_time) values(#{taskId},#{createTime})")
    @Options(useGeneratedKeys = true,keyProperty = "id")
    void addCoalition(Coalition coalition);

    @Update("update `ry-vue`.coalition set name=#{name} where id=#{id}")
    void updateCoalition(Coalition coalition);

}

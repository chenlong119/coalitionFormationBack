package com.ruoyi.project.shareIncentive.mapper;

import com.ruoyi.project.shareIncentive.domain.AuctionTask;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface AuctionTaskMapper {
//    @Select("select * from `ry-vue`.tasks;")
    List<AuctionTask> getAllTasks();

//    @Select("select * from `ry-vue`.tasks where taskState = #{taskState};")
    List<AuctionTask> getTaskByState(String taskState);


    void addTask(AuctionTask task);


    void updateTask(AuctionTask task);


    void deleteTask(String taskName);
}


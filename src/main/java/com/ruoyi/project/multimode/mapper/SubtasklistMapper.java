package com.ruoyi.project.multimode.mapper;
import com.ruoyi.project.multimode.domain.Tasklist;
import org.apache.ibatis.annotations.Mapper;
import com.ruoyi.project.multimode.domain.Subtasklist;
import java.util.List;
import java.util.Map;
@Mapper
public interface SubtasklistMapper {
    List<Subtasklist> findAll();
}

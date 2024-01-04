package com.ruoyi.project.multimode.mapper;
import com.ruoyi.project.multimode.domain.Subtasklist;
import org.apache.ibatis.annotations.Mapper;
import com.ruoyi.project.multimode.domain.BusinessTimetable;
import java.util.List;
import java.util.Map;
@Mapper
public interface BusinessTimetableMapper {
    List<BusinessTimetable> findAll();
}

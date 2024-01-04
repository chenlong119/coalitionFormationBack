package com.ruoyi.project.multimode.mapper;
import com.ruoyi.project.multimode.domain.BusinessHistory;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import java.util.List;
@Mapper
public interface BusinessHistoryMapper {

    List<BusinessHistory> findAll();
    List<BusinessHistory> findByHistoryId(String historyId);

}

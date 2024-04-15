package com.ruoyi.project.multimode.mapper;
import com.ruoyi.project.multimode.domain.Coalition;
import com.ruoyi.project.multimode.domain.CoalitionCompany;
import com.ruoyi.project.multimode.domain.CoalitionDetails;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.time.LocalDateTime;


import java.util.List;
import java.util.Map;

public interface CoalitionMapper {
    void insertCoalition(Coalition coalition);
    void updateCoalitionStatusByTaskId(@Param("taskId") Integer taskId, @Param("status") Integer status);
    List<Coalition> selectCoalitionsByTaskId(Integer taskId);
    List<CoalitionDetails> selectCoalitionDetails();
    List<CoalitionDetails> searchCoalitionByCriteria(@Param("coalitionId") Integer coalitionId,
                                                     @Param("taskId") Integer taskId,
                                                     @Param("coalitionName") String coalitionName,
                                                     @Param("modeName") String modeName);
    Integer selectLastInsertedId();
    void insertCoalitionCompany(CoalitionCompany coalitionCompany);

}

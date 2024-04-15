package com.ruoyi.project.multimode.mapper;
import com.ruoyi.project.multimode.domain.Mode;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ModeMapper {
    List<Mode> selectAllModes();

    Mode findModeById(Integer modeId);
    void updateCompetitionRateById(@Param("modeId") Integer modeId);
}

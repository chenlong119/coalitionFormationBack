package com.ruoyi.project.multig.mapper;

import com.ruoyi.project.multig.domain.FeedbackAttributes;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface FeedbackAttributesMapper {
        @Select("SELECT * FROM score_records_sxz WHERE task_id = #{taskId}")
        List<FeedbackAttributes> selectByTaskId(int taskId);

        @Update("UPDATE company_all SET score = #{satisfactionScore} WHERE id = #{companyId}")
        void updateCompanyScore(int companyId, double satisfactionScore);
}

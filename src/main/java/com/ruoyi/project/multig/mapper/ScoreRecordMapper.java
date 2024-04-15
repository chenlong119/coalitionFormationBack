package com.ruoyi.project.multig.mapper;

import com.ruoyi.project.multig.domain.ScoreRecord;
import com.ruoyi.project.multig.domain.Feedback;
import java.util.List;
import org.apache.ibatis.annotations.*;

@Mapper
public interface ScoreRecordMapper {

  @Insert("insert into score_records_sxz(task_id, company_id, evaluated_company_id, score, timestamp) " +
          "values (#{taskId}, #{companyId}, #{evaluatedCompanyId}, #{score}, #{timestamp})")
  @Options(useGeneratedKeys = true,keyProperty ="id")
  void insertScoreRecord(ScoreRecord scoreRecord);

  List<ScoreRecord> selectScoreHistory(int userId);


  void insertRelationRecord(ScoreRecord scoreRecord);

}

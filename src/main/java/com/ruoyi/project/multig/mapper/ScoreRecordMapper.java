package com.ruoyi.project.multig.mapper;

import com.ruoyi.project.multig.domain.ScoreRecord;
import java.util.List;
import org.apache.ibatis.annotations.*;

@Mapper
public interface ScoreRecordMapper {

  @Insert(
      "INSERT INTO score_records_sxz (task_id, evaluated_company_id, score, timestamp) VALUES (#{taskId}, #{evaluatedCompanyId}, #{score}, #{timestamp})")
  @Results({
    @Result(property = "taskId", column = "task_id"),
    @Result(property = "evaluatedCompanyId", column = "evaluated_company_id"),
    @Result(property = "score", column = "score"),
    @Result(property = "timestamp", column = "timestamp")
  })
  void insertScoreRecord(ScoreRecord scoreRecord);

  @Select("SELECT * FROM score_records_sxz ORDER BY timestamp DESC")
  List<ScoreRecord> selectScoreHistory();
}

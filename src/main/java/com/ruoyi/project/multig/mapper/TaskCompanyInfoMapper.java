package com.ruoyi.project.multig.mapper;

import com.ruoyi.project.multig.domain.TaskCompanyInfo;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

public interface TaskCompanyInfoMapper {

  @Select(
          "SELECT cc.coalition_id, cc.company_id, cc.date_number, cc.date_time FROM coalition_company cc "
                  + "JOIN coalition c ON cc.coalition_id = c.id "
                  + "WHERE c.task_id = #{taskId} AND cc.company_id = #{companyId}")
  @Results({
          @Result(property = "id", column = "id"),
          @Result(property = "taskId", column = "coalition_id"),
          @Result(property = "companyId", column = "company_id"),
          @Result(property = "expectedQuantity", column = "date_number"),
          @Result(property = "expectedDeliveryTime", column = "date_time")
  })
  TaskCompanyInfo selectByTaskIdAndCompanyId(
          @Param("taskId") Long taskId, @Param("companyId") Long companyId);
}

package com.ruoyi.project.multig.mapper;

import com.ruoyi.project.multig.domain.TaskCompanyInfo;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

public interface TaskCompanyInfoMapper {

  @Select(
      "SELECT id, task_info, company_info, date_number, date_time FROM evaluate_info_sxz WHERE task_info= #{taskId} AND company_info = #{companyId}")
  @Results({
    @Result(property = "id", column = "id"),
    @Result(property = "taskId", column = "task_info"),
    @Result(property = "companyId", column = "company_info"),
    @Result(property = "expectedQuantity", column = "date_number"),
    @Result(property = "expectedDeliveryTime", column = "date_time")
  })
  TaskCompanyInfo selectByTaskIdAndCompanyId(
      @Param("taskId") Long taskId, @Param("companyId") Long companyId);
}

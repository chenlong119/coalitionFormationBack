package com.ruoyi.project.multimode.service;

import com.ruoyi.project.multimode.domain.CompanyAll2;
import com.ruoyi.project.multimode.domain.PartOneCollection;
import com.ruoyi.project.multimode.domain.TaskAll2;

import java.util.List;
import java.util.Map;

public interface WorkshopSchedulingService {
  List<PartOneCollection> runAlgorithm();
  List<TaskAll2> selectActiveTasks();
  List<CompanyAll2>selectAllCompanies();

  List<String> getErrorMachinesInfo();

  List<String> getErrorMachines();

  String getDataListInfo();

  List<Integer> getMachinesForJob(int jobId);


  Map<Integer, String> getBusinessNamesByIds(List<Integer> businessIds);

  /**
   * 获取任务的跨界信息。
   *
   * @return 任务跨界信息列表
   */
  // String getTasksCrossInfo();
  Map<Integer, String> getTasksCrossInfo();

  String getBusinessNameById(String businessId);

}

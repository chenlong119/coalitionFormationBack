package com.ruoyi.project.multimode.service;

import com.ruoyi.project.multimode.domain.Business2;
import java.util.List;
import java.util.Map;

public interface WorkshopSchedulingService {
  String runAlgorithm();

  List<String> getErrorMachinesInfo();

  List<String> getErrorMachines();

  String getDataListInfo();

  List<Integer> getMachinesForJob(int jobId);

  Business2 getBusinessName(String businessName);

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

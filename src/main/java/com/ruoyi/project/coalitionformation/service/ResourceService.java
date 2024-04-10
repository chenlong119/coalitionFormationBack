package com.ruoyi.project.coalitionformation.service;

import com.ruoyi.project.coalitionformation.entity.Resource;
import java.util.List;

public interface ResourceService {
  List<Resource> getCompanyResource(Integer companyId, Integer layerId);

  List<Resource> getTaskResource(Integer taskId);
}

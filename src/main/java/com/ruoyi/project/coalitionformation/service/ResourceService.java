package com.ruoyi.project.coalitionformation.service;

import com.ruoyi.project.coalitionformation.entity.Resource;

import java.util.List;

public interface ResourceService {
  List<Resource> getCompanyResource(Integer companyId, Integer layerId);

  List<Resource> getTaskResource(Integer taskId);

  Resource getone(Integer id);

  void updateTaskResource(Integer task_id, List<Resource> resources);

  void updateCompanyResource(Integer company_id, Integer layer_id, List<Resource> resources);

  void deleteTaskResource(Integer task_id, Integer resource_id);

  void deleteCompanyResource(Integer company_id, Integer layerId, Integer resource_id);

  void insertTaskResource(Integer task_id, Resource resource);

  void insertCompanyResource(Integer company_id, Integer layerId, Resource resource);
}

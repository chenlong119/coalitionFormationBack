package com.ruoyi.project.coalitionformation.service.impl;

import com.ruoyi.project.coalitionformation.entity.Resource;
import com.ruoyi.project.coalitionformation.mapper.ResourceMapper;
import com.ruoyi.project.coalitionformation.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ResourceServiceImp implements ResourceService {

  @Autowired ResourceMapper resourceMapper;

  @Override
  public List<Resource> getCompanyResource(Integer companyId, Integer layerId) {
    return resourceMapper.getCompanyResource(companyId, layerId);
  }

  @Override
  public List<Resource> getTaskResource(Integer taskId) {
    return resourceMapper.getTaskResource(taskId);
  }

  @Override
  public Resource getone(Integer id) {
    return resourceMapper.getone(id);
  }

  @Override
  public void updateTaskResource(Integer task_id, List<Resource> resources) {
    for (Resource resource : resources) {
      resourceMapper.updateTaskResource(task_id, resource);
    }
  }

  @Override
  public void updateCompanyResource(
      Integer company_id, Integer layer_id, List<Resource> resources) {
    for (Resource resource : resources) {
      resourceMapper.updateCompanyResource(company_id, layer_id, resource);
    }
  }

  @Override
  public void deleteTaskResource(Integer task_id, Integer resource_id) {
    resourceMapper.deleteTaskResource(task_id, resource_id);
  }

  @Override
  public void deleteCompanyResource(Integer company_id, Integer layerId, Integer resource_id) {
    resourceMapper.deleteCompanyResource(company_id, layerId, resource_id);
  }

  @Override
  public void insertTaskResource(Integer task_id, Resource resource) {
    resourceMapper.insertTaskResource(task_id, resource);
  }

  @Override
  public void insertCompanyResource(Integer company_id, Integer layerId, Resource resource) {
    resourceMapper.insertCompanyResource(company_id, layerId, resource);
  }
}

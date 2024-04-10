package com.ruoyi.project.coalitionformation.service.impl;

import com.ruoyi.project.coalitionformation.entity.Resource;
import com.ruoyi.project.coalitionformation.mapper.ResourceMapper;
import com.ruoyi.project.coalitionformation.service.ResourceService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}

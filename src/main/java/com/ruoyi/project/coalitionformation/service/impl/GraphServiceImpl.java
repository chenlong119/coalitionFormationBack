package com.ruoyi.project.coalitionformation.service.impl;

import com.ruoyi.project.coalitionformation.entity.CompanyEdge;
import com.ruoyi.project.coalitionformation.entity.CompanyNode;
import com.ruoyi.project.coalitionformation.mapper.GraphMapper;
import com.ruoyi.project.coalitionformation.service.GraphService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GraphServiceImpl implements GraphService {
  @Autowired GraphMapper graphMapper;

  @Override
  public List<CompanyNode> getNodes(Integer companyType) {
    List<CompanyNode> nodes = graphMapper.getNodes(companyType);
    return nodes;
  }

  @Override
  public List<CompanyEdge> getEdges(Integer linkType) {
    return graphMapper.getEdges(linkType);
  }

  @Override
  public void addRelation(Integer id1, String id2s, Integer layer,Integer companyType) {
    String[] split = id2s.split(",");
    for (String id2 : split) graphMapper.addRelation(id1, Integer.valueOf(id2), layer,companyType);
  }
}

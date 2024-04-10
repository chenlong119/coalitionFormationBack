package com.ruoyi.project.coalitionformation.service.impl;

import com.ruoyi.project.coalitionformation.entity.CompanyEdge;
import com.ruoyi.project.coalitionformation.entity.CompanyNode;
import com.ruoyi.project.coalitionformation.mapper.GraphMapper;
import com.ruoyi.project.coalitionformation.service.GraphService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GraphServiceImpl implements GraphService {
  @Autowired GraphMapper graphMapper;

  @Override
  public List<CompanyNode> getNodes() {
    List<CompanyNode> nodes = graphMapper.getNodes();
    for (CompanyNode node : nodes) {
      node.setCategory(0);
    }
    return nodes;
  }

  @Override
  public List<CompanyEdge> getEdges() {
    return graphMapper.getEdges();
  }

  @Override
  public void addRelation(Integer id1, String id2s, Integer layer) {
    String[] split = id2s.split(",");
    for (String id2 : split) graphMapper.addRelation(id1, Integer.valueOf(id2), layer);
  }
}

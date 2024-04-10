package com.ruoyi.project.coalitionformation.service;

import com.ruoyi.project.coalitionformation.entity.CompanyEdge;
import com.ruoyi.project.coalitionformation.entity.CompanyNode;
import java.util.List;

public interface GraphService {
  public List<CompanyNode> getNodes();

  List<CompanyEdge> getEdges();

  void addRelation(Integer id1, String id2s, Integer layer);
}

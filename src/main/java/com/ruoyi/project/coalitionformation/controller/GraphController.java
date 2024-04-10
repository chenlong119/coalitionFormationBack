package com.ruoyi.project.coalitionformation.controller;

import com.ruoyi.project.coalitionformation.entity.CompanyEdge;
import com.ruoyi.project.coalitionformation.entity.CompanyNode;
import com.ruoyi.project.coalitionformation.service.GraphService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/graph")
public class GraphController {

  @Autowired private GraphService graphService;

  @GetMapping("/getnodes")
  public List<CompanyNode> getNodes() {
    return graphService.getNodes();
  }

  @GetMapping("/getedges")
  public List<CompanyEdge> getEdges() {
    return graphService.getEdges();
  }

  @GetMapping("/addrelation")
  public void addRelation(Integer id1, String id2s, Integer layer) {
    graphService.addRelation(id1, id2s, layer);
  }
}

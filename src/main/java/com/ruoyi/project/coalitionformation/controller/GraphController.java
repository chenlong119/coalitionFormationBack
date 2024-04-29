package com.ruoyi.project.coalitionformation.controller;

import com.ruoyi.project.coalitionformation.entity.CompanyEdge;
import com.ruoyi.project.coalitionformation.entity.CompanyNode;
import com.ruoyi.project.coalitionformation.service.GraphService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/graph")
public class GraphController {

  @Autowired private GraphService graphService;

  @GetMapping("/getnodes")
  public List<CompanyNode> getNodes(Integer companyType) {
    return graphService.getNodes(companyType);
  }

  @GetMapping("/getedges")
  public List<CompanyEdge> getEdges(Integer linkType) {
    return graphService.getEdges(linkType);
  }

  @GetMapping("/addrelation")
  public void addRelation(Integer id1, String id2s, Integer layer,Integer companyType) {
    graphService.addRelation(id1, id2s, layer,companyType);
  }
}

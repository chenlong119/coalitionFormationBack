package com.ruoyi.project.taskallocation.controller;

import com.ruoyi.project.taskallocation.domain.LayerDto;
import com.ruoyi.project.taskallocation.domain.LinkDto;
import com.ruoyi.project.taskallocation.domain.NodeDto;
import com.ruoyi.project.taskallocation.service.GraphService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/graph")
public class GraphController {

  @Autowired GraphService graphService;

  /**
   * @param layerDto
   * @return
   */
  @PostMapping("/getnodes")
  public List<NodeDto> getNodes(@RequestBody LayerDto layerDto) {

    return graphService.getNodes(layerDto);
  }

  @GetMapping("/getlinks")
  public List<LinkDto> getLinks() {
    return graphService.getLinks();
  }

  @GetMapping("/isloading")
  public Boolean isLoading() {
    return graphService.isLoading();
  }
}

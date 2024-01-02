package com.ruoyi.project.taskallocation.service;

import com.ruoyi.project.taskallocation.domain.LayerDto;
import com.ruoyi.project.taskallocation.domain.LinkDto;
import com.ruoyi.project.taskallocation.domain.NodeDto;
import java.util.List;

public interface GraphService {
  List<NodeDto> getNodes(LayerDto layerDto);

  List<LinkDto> getLinks();

  Boolean isLoading();
}

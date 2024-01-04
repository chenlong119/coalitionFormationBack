package com.ruoyi.project.dataFusion.domain;

import java.util.List;
import lombok.Getter;

@Getter
public class CompanyDTO {
  private List<Company2> nodes;

  public CompanyDTO(List<Company2> nodes) {
    this.nodes = nodes;
  }

  public void setNodes(List<Company2> nodes) {
    this.nodes = nodes;
  }
}

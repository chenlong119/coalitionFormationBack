package com.ruoyi.project.dataFusion.domain;

import java.util.List;
import lombok.Data;

@Data
public class CompanyRelationDTO {
  private List<Company2> nodes;
  private List<Link> links;

  public CompanyRelationDTO(List<Company2> nodes, List<Link> links) {
    this.nodes = nodes;
    this.links = links;
  }
}

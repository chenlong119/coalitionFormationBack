package com.ruoyi.project.taskallocation.domain;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class NodeDto {
  private String id;
  private String name;
  private Long category;
  private Double x;
  private Double y;
  private BusinessDto desc;
  private List<Double> value;
}

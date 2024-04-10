package com.ruoyi.project.coalitionformation.entity;

import lombok.Data;

@Data
public class CompanyEdge {
  Integer source;
  Integer target;
  Integer layer;
  Integer weight;
}

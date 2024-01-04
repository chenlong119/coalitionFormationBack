package com.ruoyi.project.dataFusion.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Company2 {
  private Integer id;
  private String name;
  private String chain;
  private Integer category;
  private Double marketShare;
  private Double marketIncrease;
  private Double profitability;
  private Double investRatio;
  private Integer productWidth;
  private Integer productDepth;
  private Double brandAwareness;
  private Double cooperationWillingness;
  private Double reputation;
  private Integer cooperationNum;
  private Double cooperationSuccess;
  private Double averageRoi;
  private Integer suppliersNum;
  private Double turnover;
  private Double deliveryRate;
  private Double tradeLevel;
  private Integer locationId;
  private Double locationX;
  private Double locationY;
  private Integer Layer;
}

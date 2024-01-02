package com.ruoyi.project.taskallocation.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@ToString
@AllArgsConstructor
@EqualsAndHashCode
public class LinkDto {
  private String source;
  private String target;
  private LineStyle lineStyle;
}

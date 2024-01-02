package com.ruoyi.project.taskallocation.domain;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ResourceDto {
  List<String> categories;
  List<Long> barData;
  List<Long> lineData;
}

package com.ruoyi.project.multimode.domain;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class NodePositionRequest {
    private int containerWidth;
    private int containerHeight;
    private int numberOfNodes;
    private int maxNodeDiameter;
}

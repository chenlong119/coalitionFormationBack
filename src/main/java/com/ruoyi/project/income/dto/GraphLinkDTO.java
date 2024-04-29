package com.ruoyi.project.income.dto;

import lombok.Data;

@Data
public class GraphLinkDTO {
    private int sourceLocation;
    private int targetLocation;
    private int layerRelation;
    private double strength;
}

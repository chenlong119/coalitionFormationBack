package com.ruoyi.project.income.domain;

import lombok.Data;

@Data
public class GraphLinkDTO {
    private int sourceLocation;
    private int targetLocation;
    private String relation;
    private double strength;
}

package com.ruoyi.project.home.entity;

import lombok.Data;

@Data
public class HomeLink {
    private Integer source;
    private Integer target;
    private Integer layer;
    private Integer weight;
    private Double strength;
}

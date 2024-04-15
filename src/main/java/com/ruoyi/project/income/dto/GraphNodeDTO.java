package com.ruoyi.project.income.dto;

import lombok.Data;

@Data
public class GraphNodeDTO {
    private int locationId;
    private int companyId;
    private String name;
    private String field;
    private String category;
    private int layer;
    private double locationX;
    private double locationY;
}

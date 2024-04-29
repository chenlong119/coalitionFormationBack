package com.ruoyi.project.income.dto;

import lombok.Data;

@Data
public class GraphNodeDTO {
    private int locationId;  //企业位置id
    private int companyId;  //企业id
    private int layerId;  //产业链id
    private String field;
    private String name;
    private int layerRelation;  //产业链关系分层
    private double locationX;
    private double locationY;
}

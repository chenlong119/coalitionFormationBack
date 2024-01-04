package com.ruoyi.project.multigshow.domain;


import lombok.Data;

@Data
public class MultigshowEnterprise {
    private Long id;
    private String name;
    private String type;
    private String companyGroup;
    private Integer cooperationCount;
    private Double score;
}

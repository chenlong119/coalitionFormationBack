package com.ruoyi.project.multigshow.domain;


import lombok.Data;

@Data
public class MultigshowEnterprise {
    private Long id;
    private String name;
    private String company_type;
    private String chain_name;
    private Integer cooperationCount;
    private Double score;
}

package com.ruoyi.project.multigshow.domain;

import java.math.BigDecimal;

public class CompanyRanking {
    private Long id;
    private String companyName;
    private BigDecimal score;
    private Integer ranking;

    // 构造方法
    public CompanyRanking() {
    }

    public CompanyRanking(Long id, String  companyName, BigDecimal score, Integer ranking) {
        this.id = id;
        this.companyName =  companyName;
        this.score = score;
        this.ranking = ranking;
    }

    // Getter 和 Setter 方法
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public BigDecimal getCompanyScore() {
        return score;
    }

    public void setCompanyScore(BigDecimal score) {
        this.score = score;
    }

    public Integer getCompanyRanking() {
        return ranking;
    }

    public void setCompanyRanking(Integer ranking) {
        this.ranking = ranking;
    }

    // toString 方法（可选，用于打印对象信息）
    @Override
    public String toString() {
        return "GroupRanking{" +
                "id=" + id +
                ", companyName='" + companyName + '\'' +
                ", score=" + score +
                ", ranking=" + ranking +
                '}';
    }
}

package com.ruoyi.project.multigshow.domain;

import java.math.BigDecimal;

public class GroupRanking {
    private Long id;
    private String groupName;
    private BigDecimal score;
    private Integer ranking;
    private String timeFrame; // 新添加的字段
    // 构造方法
    public GroupRanking() {
    }

    public GroupRanking(Long id, String groupName, BigDecimal score, Integer ranking) {
        this.id = id;
        this.groupName = groupName;
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

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public BigDecimal getScore() {
        return score;
    }

    public void setScore(BigDecimal score) {
        this.score = score;
    }

    public Integer getRanking() {
        return ranking;
    }

    public void setRanking(Integer ranking) {
        this.ranking = ranking;
    }
    public String getTimeFrame() {
        return timeFrame;
    }

    public void setTimeFrame(String timeFrame) {
        this.timeFrame = timeFrame;
    }
    // toString 方法（可选，用于打印对象信息）
    @Override
    public String toString() {
        return "GroupRanking{" +
                "id=" + id +
                ", groupName='" + groupName + '\'' +
                ", score=" + score +
                ", ranking=" + ranking +
                ", timeFrame='" + timeFrame + '\'' +
                '}';
    }
}
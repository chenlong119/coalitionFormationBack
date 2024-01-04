package com.ruoyi.project.multig.domain;

import java.sql.Timestamp;

public class ScoreRecord {
    private int id;
    private int taskId;
    private int evaluatedCompanyId;
    private double score;
    private Timestamp timestamp;

    // 构造方法
    public ScoreRecord() {
    }

    public ScoreRecord(int id, int taskId, int evaluatedCompanyId, double score, Timestamp timestamp) {
        this.id = id;
        this.taskId = taskId;
        this.evaluatedCompanyId = evaluatedCompanyId;
        this.score = score;
        this.timestamp = timestamp;
    }

    // Getter 和 Setter 方法
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTaskId() {
        return taskId;
    }

    public void setTaskId(int taskId) {
        this.taskId = taskId;
    }

    public int getEvaluatedCompanyId() {
        return evaluatedCompanyId;
    }

    public void setEvaluatedCompanyId(int evaluatedCompanyId) {
        this.evaluatedCompanyId = evaluatedCompanyId;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    // toString 方法（可选，根据需要添加）
    @Override
    public String toString() {
        return "ScoreRecord{" +
                "id=" + id +
                ", taskId=" + taskId +
                ", evaluatedCompanyId=" + evaluatedCompanyId +
                ", score=" + score +
                ", timestamp=" + timestamp +
                '}';
    }
}

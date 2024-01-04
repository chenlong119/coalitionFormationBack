package com.ruoyi.project.income.domain;

import lombok.Data;

import java.util.List;
@Data
public class FormData {
    private String time;
    private String preference;
    private List<String> strategy;
}

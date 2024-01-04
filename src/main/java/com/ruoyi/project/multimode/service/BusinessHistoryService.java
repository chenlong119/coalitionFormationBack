package com.ruoyi.project.multimode.service;

import java.util.List;
import com.ruoyi.project.multimode.domain.BusinessHistory;

public interface BusinessHistoryService {
    List<BusinessHistory> findAll();
    List<BusinessHistory> findByHistoryId(String id);
}
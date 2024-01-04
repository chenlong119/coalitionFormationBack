package com.ruoyi.project.multimode.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import com.ruoyi.project.multimode.domain.BusinessHistory;
import com.ruoyi.project.multimode.service.BusinessHistoryService;

@RestController
@RequestMapping("/businessHistory")
public class BusinessHistoryController {

    private final BusinessHistoryService businessHistoryService;

    public BusinessHistoryController(BusinessHistoryService businessHistoryService) {
        this.businessHistoryService = businessHistoryService;
    }

    @GetMapping("/getDatalist")
    public List<BusinessHistory> getAllBusinessHistories() {
        return businessHistoryService.findAll();
    }
//    @GetMapping("/historyById/{historyId}")
//    public ResponseEntity<List<BusinessHistory>> getBusinessHistoryByHistoryIds(@PathVariable String historyId) {
//        List<BusinessHistory> businessHistories = new ArrayList<>();
//        String[] ids = historyId.split(","); // 拆分 IDs
//        for (String id : ids) {
//            List<BusinessHistory> histories = businessHistoryService.findByHistoryId(id.trim());
//            if (histories != null) {
//                businessHistories.addAll(histories);
//            }
//        }
//        if (!businessHistories.isEmpty()) {
//            return ResponseEntity.ok(businessHistories);
//        } else {
//            return ResponseEntity.notFound().build();
//        }
//    }
@PostMapping("/historyById")
public ResponseEntity<List<BusinessHistory>> getBusinessHistoryByHistoryIds(@RequestBody List<String> historyIds) {
    List<BusinessHistory> businessHistories = new ArrayList<>();

    for (String id : historyIds) {
        List<BusinessHistory> histories = businessHistoryService.findByHistoryId(id.trim());
        if (histories != null) {
            businessHistories.addAll(histories);
        }
    }
    if (!businessHistories.isEmpty()) {
        return ResponseEntity.ok(businessHistories);
    } else {
        return ResponseEntity.notFound().build();
    }
}

}


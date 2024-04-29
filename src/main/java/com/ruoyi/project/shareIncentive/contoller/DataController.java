package com.ruoyi.project.shareIncentive.contoller;

import com.ruoyi.project.shareIncentive.domain.Data;
import com.ruoyi.project.shareIncentive.service.DataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/data")
public class DataController {
    @Autowired
    private DataService dataService;
    @GetMapping("/{dataId}")
    public ResponseEntity<Data> getDataById(@PathVariable Long dataId){
        Data data = dataService.getDataById(dataId);
        return ResponseEntity.ok(data);
    }
    @GetMapping("/all")
    public ResponseEntity<List<Data>> getAllData() {
        List<Data> data = dataService.getAllData();
        return ResponseEntity.ok(data);
    }
    @GetMapping("/end")
    public void settlement(){
        dataService.updateNewBid();
//        dataService.addTemp();
    }
 }

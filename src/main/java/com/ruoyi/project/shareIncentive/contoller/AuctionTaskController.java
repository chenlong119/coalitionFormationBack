package com.ruoyi.project.shareIncentive.contoller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.ruoyi.project.shareIncentive.domain.AuctionTask;
import com.ruoyi.project.shareIncentive.service.AuctionTaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import com.fasterxml.jackson.databind.ObjectMapper;
@RestController
@RequestMapping("/tasks")
public class AuctionTaskController {
    private final AuctionTaskService auctionTaskService;

    @Autowired
    public AuctionTaskController(AuctionTaskService auctionTaskService) {
        this.auctionTaskService = auctionTaskService;
    }

    @GetMapping("/all")
    public ResponseEntity<List<AuctionTask>> getAllTasks() throws JsonProcessingException {
        List<AuctionTask> tasks = auctionTaskService.getAllTasks();
//        转化为json格式
        ObjectMapper objectMapper = new ObjectMapper();
        for (AuctionTask task : tasks) {

            String[] dataProvidersArray = task.getDataProviders().split(",");
            String jsonDataProviders = objectMapper.writeValueAsString(Arrays.asList(dataProvidersArray));
            task.setDataProviders(jsonDataProviders);

            // 处理 dataProviderValues
            String[] dataProviderValuesArray = task.getDataProviderValues().split(",");
            String jsonDataProviderValues = objectMapper.writeValueAsString(dataProviderValuesArray);
            task.setDataProviderValues(jsonDataProviderValues);

            // 处理 dataProviderRates
            String[] dataProviderRatesArray = task.getDataProviderRates().split(",");
            String jsonDataProviderRates = objectMapper.writeValueAsString(dataProviderRatesArray);
            task.setDataProviderRates(jsonDataProviderRates);


            // 处理 dataNames
            String[] dataNamesArray = task.getDataNames().split(",");
            String jsonDataNames = objectMapper.writeValueAsString(dataNamesArray);
            task.setDataNames(jsonDataNames);
        }
        System.out.println(tasks.get(1).getDataProviders());
        return ResponseEntity.ok(tasks);
    }

    @GetMapping("/{taskState}")
    public ResponseEntity<List<AuctionTask>> getTaskByState(@PathVariable String taskState) throws JsonProcessingException {
        List<AuctionTask> tasks = auctionTaskService.getTaskByState(taskState);
        ObjectMapper objectMapper = new ObjectMapper();
        for (AuctionTask task : tasks) {

            String[] dataProvidersArray = task.getDataProviders().split(",");
            String jsonDataProviders = objectMapper.writeValueAsString(Arrays.asList(dataProvidersArray));
            task.setDataProviders(jsonDataProviders);

            // 处理 dataProviderValues
            String[] dataProviderValuesArray = task.getDataProviderValues().split(",");
            String jsonDataProviderValues = objectMapper.writeValueAsString(dataProviderValuesArray);
            task.setDataProviderValues(jsonDataProviderValues);

            // 处理 dataProviderRates
            String[] dataProviderRatesArray = task.getDataProviderRates().split(",");
            String jsonDataProviderRates = objectMapper.writeValueAsString(dataProviderRatesArray);
            task.setDataProviderRates(jsonDataProviderRates);

            // 处理 dataNames
            String[] dataNamesArray = task.getDataNames().split(",");
            String jsonDataNames = objectMapper.writeValueAsString(dataNamesArray);
            task.setDataNames(jsonDataNames);
        }
        System.out.println(tasks.get(1).getDataNames());

        return ResponseEntity.ok(tasks);

    }

    @   PostMapping("/add")
    public ResponseEntity<Void> addTask(@RequestBody AuctionTask task) {
        System.out.println("taskname:"+task.getDataFinish());
        auctionTaskService.addTask(task);
        return ResponseEntity.ok().build();
    }

    @PutMapping("/update")
    public ResponseEntity<Void> updateTask(@RequestBody AuctionTask task) {
        auctionTaskService.updateTask(task);
        return ResponseEntity.ok().build();
    }

    @DeleteMapping("/delete/{taskName}")
    public ResponseEntity<Void> deleteTask(@PathVariable String taskName) {
        auctionTaskService.deleteTask(taskName);
        return ResponseEntity.ok().build();

    }
}

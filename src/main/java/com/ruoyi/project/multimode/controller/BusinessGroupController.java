package com.ruoyi.project.multimode.controller;

import com.ruoyi.project.multimode.domain.BusinessGroup;
import com.ruoyi.project.multimode.service.BusinessGroupService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@Slf4j
@RequestMapping("/businessGroup")
public class BusinessGroupController
{
    @Autowired
    private BusinessGroupService businessGroupService;
    // 添加一个接口，用于获取整个数据库列表
    @GetMapping("/getAllDataList")
    public List<BusinessGroup> getAllDataList() {
        System.out.println(businessGroupService.getAllDataList());
        return businessGroupService.getAllDataList();
    }

    /**
     * 根据 business_group_id 查询企业群信息
     *
     * @param businessGroupId 企业群ID
     * @return 企业群信息
     */
    @GetMapping("/getById/{businessGroupId}")
    public List<BusinessGroup> getBusinessGroupById(@PathVariable String businessGroupId) {
//        System.out.println(businessGroupService.selectBusinessGroupById(businessGroupId));
        log.info("id:{}",businessGroupId);
        return businessGroupService.selectBusinessGroupById(businessGroupId);
    }

    /**
     * 根据 business_group_name 查询企业群信息列表
     *
     * @param businessGroupName 企业群名称
     * @return 企业群信息列表
     */
    @GetMapping("/getByName/{businessGroupName}")
    public List<BusinessGroup> getBusinessGroupByName(@PathVariable String businessGroupName) {
        System.out.println(businessGroupService.selectBusinessGroupByName(businessGroupName));
        return businessGroupService.selectBusinessGroupByName(businessGroupName);
    }

    /**
     * 根据 business_group_mode 查询企业群信息列表
     *
     * @param businessGroupMode 企业群模式
     * @return 企业群信息列表
     */
    @GetMapping("/getByMode/{businessGroupMode}")
    public List<BusinessGroup> getBusinessGroupByMode(@PathVariable String businessGroupMode) {
        return businessGroupService.selectBusinessGroupByMode(businessGroupMode);
    }

    /**
     * 根据 business_group_no 查询企业群信息列表
     *
     * @param businessGroupTask 企业群编号
     * @return 企业群信息列表
     */
    @GetMapping("/getByTask/{businessGroupTask}")
    public List<BusinessGroup> getBusinessGroupByTask(@PathVariable String businessGroupTask) {
        return businessGroupService.selectBusinessGroupByTask(businessGroupTask);
    }

    /**
     * 分页查询企业群信息列表
     *
     * @param businessGroup 企业群信息条件
     * @return 企业群信息列表
     */
    @PostMapping("/getPage")
    public List<BusinessGroup> getBusinessGroupPage(@RequestBody BusinessGroup businessGroup) {
        return businessGroupService.selectBusinessGroupPage(businessGroup);
    }

    /**
     * 获取每种协同模式的数量
     *
     * @return 每种协同模式的数量列表
     */
    @GetMapping("/countByMode")
    public ResponseEntity<List<Map<String, Object>>> countBusinessGroupByMode() {
        List<Map<String, Object>> countList = businessGroupService.countBusinessGroupByMode();
        return new ResponseEntity<>(countList, HttpStatus.OK);
    }
    @GetMapping("/count")
    public int getTotalBusinessGroupCount() {
        return businessGroupService.getTotalBusinessGroupCount();
    }
}
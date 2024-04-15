package com.ruoyi.project.dataFusion.controller;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.StringUtils;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
@Slf4j
@RestController
@RequestMapping("/dataFusion")
public class DataFusionController {
    @PostMapping("/test")
    public AjaxResult testDataFusion(@RequestBody String formData) {
        if (StringUtils.isBlank(formData)) {
            return AjaxResult.error("无效的数据");
        }

        // 在这里简单打印接收到的数据
        System.out.println("接收到的数据：" + formData);

        return AjaxResult.success("数据接收成功");
    }
}

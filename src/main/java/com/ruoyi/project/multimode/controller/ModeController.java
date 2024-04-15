package com.ruoyi.project.multimode.controller;

import com.ruoyi.project.multimode.domain.Mode;
import com.ruoyi.project.multimode.service.ModeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@RestController
@RequestMapping("/mode")
public class ModeController {

    @Autowired
    private ModeService modeService;

    private static final Logger logger = LoggerFactory.getLogger(ModeController.class);


    @GetMapping("/getAllModes")
    public List<Mode> getAllModes() {
        logger.info("Received request to getAllModes");
        List<Mode> modes = modeService.getAllModes();
        logger.info("Returning modes data: {}", modes);
        return modes;
    }
}

package com.ruoyi.project.multimode.controller;

import com.ruoyi.project.multimode.domain.Solution;
import com.ruoyi.project.multimode.service.SolutionService;
import com.ruoyi.project.multimode.service.ModeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SolutionController {

    @Autowired
    private SolutionService solutionService;
    @Autowired
    private ModeService modeService;

    @PostMapping("/solutions/addSolution")
    public String addSolution(@RequestBody Solution solution) {
        solutionService.processSolution(solution);
        modeService.incrementCompetitionRate(solution.getMode());
        System.out.println("Received solution: " + solution);

        return "解决方案处理完成";
    }

}

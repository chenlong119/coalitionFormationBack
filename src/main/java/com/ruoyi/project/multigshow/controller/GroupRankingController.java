package com.ruoyi.project.multigshow.controller;



import com.ruoyi.project.multigshow.domain.GroupRanking;
import com.ruoyi.project.multigshow.service.IGroupRankingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/system/ranking")
public class GroupRankingController {

    @Autowired
    private IGroupRankingService groupRankingService;

    @GetMapping("/list")
    public List<GroupRanking> list() {
        return groupRankingService.selectGroupRankingList();
    }

    @PostMapping("/update")
    public int update(@RequestBody GroupRanking groupRanking) {
        return groupRankingService.updateGroupRanking(groupRanking);
    }
}

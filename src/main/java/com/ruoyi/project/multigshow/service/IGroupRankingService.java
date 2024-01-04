package com.ruoyi.project.multigshow.service;



import com.ruoyi.project.multigshow.domain.GroupRanking;
import java.util.List;

public interface IGroupRankingService {
    List<GroupRanking> selectGroupRankingList();
    int updateGroupRanking(GroupRanking groupRanking);
}

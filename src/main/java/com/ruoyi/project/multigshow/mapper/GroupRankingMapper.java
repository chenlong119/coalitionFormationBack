package com.ruoyi.project.multigshow.mapper;
import org.springframework.stereotype.Repository;


import com.ruoyi.project.multigshow.domain.GroupRanking;
import java.util.List;

public interface GroupRankingMapper {
    List<GroupRanking> selectGroupRankingList();
    int updateGroupRanking(GroupRanking groupRanking);
}

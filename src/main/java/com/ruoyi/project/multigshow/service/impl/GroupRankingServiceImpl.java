package com.ruoyi.project.multigshow.service.impl;


import com.ruoyi.project.multigshow.domain.GroupRanking;
import com.ruoyi.project.multigshow.mapper.GroupRankingMapper;
import com.ruoyi.project.multigshow.service.IGroupRankingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class GroupRankingServiceImpl implements IGroupRankingService {

    private final GroupRankingMapper groupRankingMapper;

    @Autowired
    public GroupRankingServiceImpl(GroupRankingMapper groupRankingMapper) {
        this.groupRankingMapper = groupRankingMapper;
    }

    @Override
    public List<GroupRanking> selectGroupRankingList() {
        return groupRankingMapper.selectGroupRankingList();
    }

    @Override
    public int updateGroupRanking(GroupRanking groupRanking) {
        return groupRankingMapper.updateGroupRanking(groupRanking);
    }
}

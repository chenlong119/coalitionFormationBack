package com.ruoyi.project.home.service.impl;

import com.ruoyi.project.coalitionformation.entity.CompanyNode;
import com.ruoyi.project.coalitionformation.mapper.GraphMapper;
import com.ruoyi.project.home.entity.HomeLink;
import com.ruoyi.project.home.entity.HomeNode;
import com.ruoyi.project.home.mapper.HomeMapper;
import com.ruoyi.project.home.service.HomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HomeServiceImpl implements HomeService {

    @Autowired
    HomeMapper homeMapper;

    @Override
    public List<HomeNode> getHomeNodes() {
        return homeMapper.getHomeNodes();
    }

    @Override
    public List<HomeLink> getHomeLinks(){
        return homeMapper.getHomeLinks();
    }

}

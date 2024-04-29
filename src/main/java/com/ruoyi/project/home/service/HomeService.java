package com.ruoyi.project.home.service;

import com.ruoyi.project.home.entity.HomeLink;
import com.ruoyi.project.home.entity.HomeNode;

import java.util.List;

public interface HomeService {

    List<HomeNode> getHomeNodes();

    List<HomeLink> getHomeLinks();

}

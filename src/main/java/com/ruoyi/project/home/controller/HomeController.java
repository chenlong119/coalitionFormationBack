package com.ruoyi.project.home.controller;


import com.ruoyi.project.home.entity.HomeLink;
import com.ruoyi.project.home.entity.HomeNode;
import com.ruoyi.project.home.service.HomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/home")
@CrossOrigin
public class HomeController {

    @Autowired
    private HomeService homeService;

    @GetMapping("/getnodes")
    public List<HomeNode> getNodes() {
        return homeService.getHomeNodes();
    }

    @GetMapping("/getlinks")
    public List<HomeLink> getLinks() {
        return homeService.getHomeLinks();
    }

}

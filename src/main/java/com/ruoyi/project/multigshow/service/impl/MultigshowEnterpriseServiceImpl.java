package com.ruoyi.project.multigshow.service.impl;

import com.ruoyi.project.multigshow.domain.MultigshowEnterprise;
import com.ruoyi.project.multigshow.mapper.MultigshowEnterpriseMapper;
import com.ruoyi.project.multigshow.service.IEnterpriseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class MultigshowEnterpriseServiceImpl implements IEnterpriseService {

    @Autowired
    private  MultigshowEnterpriseMapper enterpriseMapper;

    @Override
    public List< MultigshowEnterprise> selectEnterpriseList() {
        return enterpriseMapper.selectEnterpriseList();
    }

    // 实现其他业务方法
}

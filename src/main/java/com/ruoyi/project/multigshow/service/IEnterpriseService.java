package com.ruoyi.project.multigshow.service;

import com.ruoyi.project.multigshow.domain. MultigshowEnterprise;
import java.util.List;

public interface IEnterpriseService {
    List< MultigshowEnterprise> selectEnterpriseList();
    // 可以根据需要添加其他业务方法，例如添加、更新或删除企业信息
}

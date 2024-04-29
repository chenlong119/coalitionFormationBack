package com.ruoyi.project.generate.coalition.service.impl;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.project.generate.coalition.domain.CoalitionEnterprise;
import com.ruoyi.project.generate.coalition.mapper.CoalitionEnterpriseMapper;
import com.ruoyi.project.generate.coalition.service.ICoalitionEnterpriseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 企业联盟Service业务层处理
 * 
 * @author cl
 * @date 2024-04-15
 */
@Service
public class CoalitionEnterpriseServiceImpl implements ICoalitionEnterpriseService 
{
    @Autowired
    private CoalitionEnterpriseMapper coalitionEnterpriseMapper;

    /**
     * 查询企业联盟
     * 
     * @param id 企业联盟主键
     * @return 企业联盟
     */
    @Override
    public CoalitionEnterprise selectCoalitionEnterpriseById(Long id)
    {
        return coalitionEnterpriseMapper.selectCoalitionEnterpriseById(id);
    }

    /**
     * 查询企业联盟列表
     * 
     * @param coalitionEnterprise 企业联盟
     * @return 企业联盟
     */
    @Override
    public List<CoalitionEnterprise> selectCoalitionEnterpriseList(CoalitionEnterprise coalitionEnterprise)
    {
        return coalitionEnterpriseMapper.selectCoalitionEnterpriseList(coalitionEnterprise);
    }

    /**
     * 新增企业联盟
     * 
     * @param coalitionEnterprise 企业联盟
     * @return 结果
     */
    @Override
    public int insertCoalitionEnterprise(CoalitionEnterprise coalitionEnterprise)
    {
        coalitionEnterprise.setCreateTime(DateUtils.getNowDate());
        return coalitionEnterpriseMapper.insertCoalitionEnterprise(coalitionEnterprise);
    }

    /**
     * 修改企业联盟
     * 
     * @param coalitionEnterprise 企业联盟
     * @return 结果
     */
    @Override
    public int updateCoalitionEnterprise(CoalitionEnterprise coalitionEnterprise)
    {
        return coalitionEnterpriseMapper.updateCoalitionEnterprise(coalitionEnterprise);
    }

    /**
     * 批量删除企业联盟
     * 
     * @param ids 需要删除的企业联盟主键
     * @return 结果
     */
    @Override
    public int deleteCoalitionEnterpriseByIds(Long[] ids)
    {
        return coalitionEnterpriseMapper.deleteCoalitionEnterpriseByIds(ids);
    }

    /**
     * 删除企业联盟信息
     * 
     * @param id 企业联盟主键
     * @return 结果
     */
    @Override
    public int deleteCoalitionEnterpriseById(Long id)
    {
        return coalitionEnterpriseMapper.deleteCoalitionEnterpriseById(id);
    }

    @Override
    public List<CoalitionEnterprise> getAll() {
        return coalitionEnterpriseMapper.getAll();
    }
}

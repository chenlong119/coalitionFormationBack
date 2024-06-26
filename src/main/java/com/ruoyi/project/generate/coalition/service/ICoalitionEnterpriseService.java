package com.ruoyi.project.generate.coalition.service;

import com.ruoyi.project.generate.coalition.domain.CoalitionDto;
import com.ruoyi.project.generate.coalition.domain.CoalitionEnterprise;

import java.util.List;

/**
 * 企业联盟Service接口
 * 
 * @author cl
 * @date 2024-04-15
 */
public interface ICoalitionEnterpriseService 
{
    /**
     * 查询企业联盟
     * 
     * @param id 企业联盟主键
     * @return 企业联盟
     */
    public CoalitionEnterprise selectCoalitionEnterpriseById(Long id);

    /**
     * 查询企业联盟列表
     * 
     * @param coalitionEnterprise 企业联盟
     * @return 企业联盟集合
     */
    public List<CoalitionEnterprise> selectCoalitionEnterpriseList(CoalitionEnterprise coalitionEnterprise);

    /**
     * 新增企业联盟
     * 
     * @param coalitionEnterprise 企业联盟
     * @return 结果
     */
    public int insertCoalitionEnterprise(CoalitionEnterprise coalitionEnterprise);

   public  List<CoalitionEnterprise>  selectCoalitionByCompanyId(CoalitionDto coalitionDto);
    /**
     * 修改企业联盟
     * 
     * @param coalitionEnterprise 企业联盟
     * @return 结果
     */
    public int updateCoalitionEnterprise(CoalitionEnterprise coalitionEnterprise);

    /**
     * 批量删除企业联盟
     * 
     * @param ids 需要删除的企业联盟主键集合
     * @return 结果
     */
    public int deleteCoalitionEnterpriseByIds(Long[] ids);

    /**
     * 删除企业联盟信息
     * 
     * @param id 企业联盟主键
     * @return 结果
     */
    public int deleteCoalitionEnterpriseById(Long id);

    List<CoalitionEnterprise> getAll();
}

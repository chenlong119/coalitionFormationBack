package com.ruoyi.project.generate.coalition.mapper;

import com.ruoyi.project.generate.coalition.domain.CoalitionEnterprise;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 企业联盟Mapper接口
 * 
 * @author cl
 * @date 2024-04-15
 */
public interface CoalitionEnterpriseMapper 
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

    /**
     * 修改企业联盟
     * 
     * @param coalitionEnterprise 企业联盟
     * @return 结果
     */
    public int updateCoalitionEnterprise(CoalitionEnterprise coalitionEnterprise);

    /**
     * 删除企业联盟
     * 
     * @param id 企业联盟主键
     * @return 结果
     */
    public int deleteCoalitionEnterpriseById(Long id);

    /**
     * 批量删除企业联盟
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCoalitionEnterpriseByIds(Long[] ids);

    @Select("select * from `ry-vue`.coalition")
    List<CoalitionEnterprise> getAll();
}

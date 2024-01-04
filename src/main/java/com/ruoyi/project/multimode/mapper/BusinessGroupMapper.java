package com.ruoyi.project.multimode.mapper;

import org.apache.ibatis.annotations.Mapper;
import com.ruoyi.project.multimode.domain.BusinessGroup;
import java.util.List;
import java.util.Map;

public interface BusinessGroupMapper
{
    List<BusinessGroup> getAllDataList();
    /**
     * 根据 business_group_id 查询企业群信息
     *
     * @param businessGroupId 企业群ID
     * @return 企业群信息
     */
    public List<BusinessGroup> selectBusinessGroupById(String businessGroupId);

    /**
     * 根据 business_group_name 查询企业群信息列表
     *
     * @param businessGroupName 企业群名称
     * @return 企业群信息列表
     */
    public List<BusinessGroup> selectBusinessGroupByName(String businessGroupName);

    /**
     * 根据 business_group_mode 查询企业群信息列表
     *
     * @param businessGroupMode 企业群模式
     * @return 企业群信息列表
     */
    public List<BusinessGroup> selectBusinessGroupByMode(String businessGroupMode);

    /**
     * 根据 business_group_no 查询企业群信息列表
     *
     * @param businessGroupTask 企业群编号
     * @return 企业群信息列表
     */
    public List<BusinessGroup> selectBusinessGroupByTask(String businessGroupTask);

    /**
     * 分页查询企业群信息列表
     *
     * @param businessGroup 企业群信息条件
     * @return 企业群信息列表
     */
    public List<BusinessGroup> selectBusinessGroupPage(BusinessGroup businessGroup);

    /**
     * 获取每种协同模式的数量
     *
     * @return 每种协同模式的数量列表
     */
    List<Map<String, Object>> countBusinessGroupByMode();

    int getTotalCount();
}
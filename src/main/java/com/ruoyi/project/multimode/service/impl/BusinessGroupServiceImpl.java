package com.ruoyi.project.multimode.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.multimode.mapper.BusinessGroupMapper;
import com.ruoyi.project.multimode.domain.BusinessGroup;
import com.ruoyi.project.multimode.service.BusinessGroupService;
import java.util.List;
import java.util.Map;

@Service
public class BusinessGroupServiceImpl implements BusinessGroupService {
    @Autowired
    private BusinessGroupMapper businessGroupMapper;

    @Override
    public List<BusinessGroup> getAllDataList() {
        return businessGroupMapper.getAllDataList();
    }

    @Override
    public List<BusinessGroup> selectBusinessGroupById(String businessGroupId) {
        return businessGroupMapper.selectBusinessGroupById(businessGroupId);
    }

    @Override
    public List<BusinessGroup> selectBusinessGroupByName(String businessGroupName) {
        return businessGroupMapper.selectBusinessGroupByName(businessGroupName);
    }

    @Override
    public List<BusinessGroup> selectBusinessGroupByMode(String businessGroupMode) {
        return businessGroupMapper.selectBusinessGroupByMode(businessGroupMode);
    }

    @Override
    public List<BusinessGroup> selectBusinessGroupByTask(String businessGroupTask) {
        return businessGroupMapper.selectBusinessGroupByTask(businessGroupTask);
    }

    @Override
    public List<BusinessGroup> selectBusinessGroupPage(BusinessGroup businessGroup) {
        return businessGroupMapper.selectBusinessGroupPage(businessGroup);
    }

    @Override
    public List<Map<String, Object>> countBusinessGroupByMode() {
        return businessGroupMapper.countBusinessGroupByMode();
    }
    @Override
    public int getTotalBusinessGroupCount() {
        return businessGroupMapper.getTotalCount();
    }
}
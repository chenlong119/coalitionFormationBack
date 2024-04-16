package com.ruoyi.project.generate.coalition.controller;

import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.generate.coalition.domain.CoalitionEnterprise;
import com.ruoyi.project.generate.coalition.service.ICoalitionEnterpriseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 企业联盟Controller
 * 
 * @author cl
 * @date 2024-04-15
 */
@RestController
@RequestMapping("/coalition/enterprise")
public class CoalitionEnterpriseController extends BaseController
{
    @Autowired
    private ICoalitionEnterpriseService coalitionEnterpriseService;

    /**
     * 查询企业联盟列表
     */
    @PreAuthorize("@ss.hasPermi('coalition:enterprise:list')")
    @GetMapping("/list")
    public TableDataInfo list(CoalitionEnterprise coalitionEnterprise)
    {
        startPage();
        List<CoalitionEnterprise> list = coalitionEnterpriseService.selectCoalitionEnterpriseList(coalitionEnterprise);
        return getDataTable(list);
    }

    /**
     * 导出企业联盟列表
     */
    @PreAuthorize("@ss.hasPermi('coalition:enterprise:export')")
    @Log(title = "企业联盟", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, CoalitionEnterprise coalitionEnterprise)
    {
        List<CoalitionEnterprise> list = coalitionEnterpriseService.selectCoalitionEnterpriseList(coalitionEnterprise);
        ExcelUtil<CoalitionEnterprise> util = new ExcelUtil<CoalitionEnterprise>(CoalitionEnterprise.class);
        util.exportExcel(response, list, "企业联盟数据");
    }

    /**
     * 获取企业联盟详细信息
     */
    @PreAuthorize("@ss.hasPermi('coalition:enterprise:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(coalitionEnterpriseService.selectCoalitionEnterpriseById(id));
    }

    /**
     * 新增企业联盟
     */
    @PreAuthorize("@ss.hasPermi('coalition:enterprise:add')")
    @Log(title = "企业联盟", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CoalitionEnterprise coalitionEnterprise)
    {
        return toAjax(coalitionEnterpriseService.insertCoalitionEnterprise(coalitionEnterprise));
    }

    /**
     * 修改企业联盟
     */
    @PreAuthorize("@ss.hasPermi('coalition:enterprise:edit')")
    @Log(title = "企业联盟", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CoalitionEnterprise coalitionEnterprise)
    {
        return toAjax(coalitionEnterpriseService.updateCoalitionEnterprise(coalitionEnterprise));
    }

    /**
     * 删除企业联盟
     */
    @PreAuthorize("@ss.hasPermi('coalition:enterprise:remove')")
    @Log(title = "企业联盟", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(coalitionEnterpriseService.deleteCoalitionEnterpriseByIds(ids));
    }

    @GetMapping("/getall")
    public List<CoalitionEnterprise> getAll()
    {
        return coalitionEnterpriseService.getAll();
    }
}

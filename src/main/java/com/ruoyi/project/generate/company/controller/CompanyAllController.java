package com.ruoyi.project.generate.company.controller;

import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.generate.company.domain.CompanyAll;
import com.ruoyi.project.generate.company.domain.CompanyCoalition;
import com.ruoyi.project.generate.company.service.ICompanyAllService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 企业信息Controller
 *
 * @author cl
 * @date 2024-04-02
 */
@RestController
@RequestMapping("/company/show")
public class CompanyAllController extends BaseController {
  @Autowired private ICompanyAllService companyAllService;

  /** 查询企业信息列表 */
  @PreAuthorize("@ss.hasPermi('company:show:list')")
  @GetMapping("/list")
  public TableDataInfo list(CompanyAll companyAll) {
    startPage();
    List<CompanyAll> list = companyAllService.selectCompanyAllList(companyAll);
    return getDataTable(list);
  }


  /** 导出企业信息列表 */
  @PreAuthorize("@ss.hasPermi('company:show:export')")
  @Log(title = "企业信息", businessType = BusinessType.EXPORT)
  @PostMapping("/export")
  public void export(HttpServletResponse response, CompanyAll companyAll) {
    List<CompanyAll> list = companyAllService.selectCompanyAllList(companyAll);
    ExcelUtil<CompanyAll> util = new ExcelUtil<CompanyAll>(CompanyAll.class);
    util.exportExcel(response, list, "企业信息数据");
  }

  /** 获取企业信息详细信息 */
  @PreAuthorize("@ss.hasPermi('company:show:query')")
  @GetMapping(value = "/{id}/{layerId}")
  public AjaxResult getInfo(@PathVariable("id") Long id, @PathVariable Long layerId) {
    return success(companyAllService.selectCompanyAllById(id, layerId));
  }

  /** 新增企业信息 */
  @PreAuthorize("@ss.hasPermi('company:show:add')")
  @Log(title = "企业信息", businessType = BusinessType.INSERT)
  @PostMapping
  public AjaxResult add(@RequestBody CompanyAll companyAll) {
    return toAjax(companyAllService.insertCompanyAll(companyAll));
  }

  /** 修改企业信息 */
  @PreAuthorize("@ss.hasPermi('company:show:edit')")
  @Log(title = "企业信息", businessType = BusinessType.UPDATE)
  @PutMapping
  public AjaxResult edit(@RequestBody CompanyAll companyAll) {
    return toAjax(companyAllService.updateCompanyAll(companyAll));
  }

  /** 删除企业信息 */
  @PreAuthorize("@ss.hasPermi('company:show:remove')")
  @Log(title = "企业信息", businessType = BusinessType.DELETE)
  @DeleteMapping("/{ids}")
  public AjaxResult remove(@PathVariable Long[] ids) {
    return toAjax(companyAllService.deleteCompanyAllByIds(ids));
  }

  @GetMapping("/getone")
  public CompanyAll getOneCompany(Integer id, Integer layer) {
    return companyAllService.getOneCompany(id, layer);
  }

  @GetMapping("/getbyid")
  public List<CompanyAll> getCompanyById(Integer id) {
    return companyAllService.getById(id);
  }

  @GetMapping("/getnames")
  public List<String> getNamesByIds(String ids) {
    return companyAllService.getNamesByIds(ids);
  }

  @GetMapping("/getcompanybycoalition")
    public List<CompanyCoalition> getCompanyByCoalition(Integer coalitionId) {
        return companyAllService.getCompanyByCoalition(coalitionId);
    }
    @GetMapping("/getallcoalition")
    public  List<CompanyCoalition> getallCoalition()
    {
      return companyAllService.getallCoalition();
    }

    @GetMapping("/getall")
  public List<CompanyAll> getAllCompany() {
    return companyAllService.getAllCompany();
  }
}

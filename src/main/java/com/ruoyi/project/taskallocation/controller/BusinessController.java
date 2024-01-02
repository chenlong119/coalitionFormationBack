package com.ruoyi.project.taskallocation.controller;

import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.redis.RedisCache;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.taskallocation.domain.Business;
import com.ruoyi.project.taskallocation.domain.NeighborDto;
import com.ruoyi.project.taskallocation.domain.ResourceDto;
import com.ruoyi.project.taskallocation.service.IBusinessService;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 企业信息Controller
 *
 * @author cl
 * @date 2023-12-05
 */
@RestController
@RequestMapping("/taskallocation/business")
public class BusinessController extends BaseController {
  @Autowired private IBusinessService businessService;
  @Autowired private RedisCache redisCache;

  /**
   * 根据企业id获取对应资源信息
   *
   * @param business
   * @return
   */
  @GetMapping("/resource")
  public ResourceDto getResource(Long id, String type) {
    return businessService.getResource(id, type);
  }

  /**
   * 根据关键字获取企业信息
   *
   * @param kw
   * @return
   */
  @GetMapping("/neighbor")
  public List<NeighborDto> getNeighbor(String kw) {
    return businessService.getNeighbor(kw);
  }

  /** 查询企业信息列表 */
  @PreAuthorize("@ss.hasPermi('taskallocation:business:list')")
  @GetMapping("/list")
  public TableDataInfo list(Business business) {
    startPage();
    List<Business> list = businessService.selectBusinessList(business);
    return getDataTable(list);
  }

  /** 导出企业信息列表 */
  @PreAuthorize("@ss.hasPermi('taskallocation:business:export')")
  @Log(title = "企业信息", businessType = BusinessType.EXPORT)
  @PostMapping("/export")
  public void export(HttpServletResponse response, Business business) {
    List<Business> list = businessService.selectBusinessList(business);
    ExcelUtil<Business> util = new ExcelUtil<Business>(Business.class);
    util.exportExcel(response, list, "企业信息数据");
  }

  /** 获取企业信息详细信息 */
  @PreAuthorize("@ss.hasPermi('taskallocation:business:query')")
  @GetMapping(value = "/{id}")
  public AjaxResult getInfo(@PathVariable("id") String id) {
    return success(businessService.selectBusinessById(id));
  }

  /** 新增企业信息 */
  @PreAuthorize("@ss.hasPermi('taskallocation:business:add')")
  @Log(title = "企业信息", businessType = BusinessType.INSERT)
  @PostMapping
  public AjaxResult add(@RequestBody Business business) {
    redisCache.setCacheObject("chy:loading", true);
    return toAjax(businessService.insertBusiness(business));
  }

  /** 修改企业信息 */
  @PreAuthorize("@ss.hasPermi('taskallocation:business:edit')")
  @Log(title = "企业信息", businessType = BusinessType.UPDATE)
  @PutMapping
  public AjaxResult edit(@RequestBody Business business) {
    redisCache.setCacheObject("chy:loading", true);
    return toAjax(businessService.updateBusiness(business));
  }

  /** 删除企业信息 */
  @PreAuthorize("@ss.hasPermi('taskallocation:business:remove')")
  @Log(title = "企业信息", businessType = BusinessType.DELETE)
  @DeleteMapping("/{ids}")
  public AjaxResult remove(@PathVariable String[] ids) {
    redisCache.setCacheObject("chy:loading", true);
    return toAjax(businessService.deleteBusinessByIds(ids));
  }
}

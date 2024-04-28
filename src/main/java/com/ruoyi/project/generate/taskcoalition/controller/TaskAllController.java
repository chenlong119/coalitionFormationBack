package com.ruoyi.project.generate.taskcoalition.controller;

import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.security.LoginUser;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.generate.taskcoalition.domain.TaskAll;
import com.ruoyi.project.generate.taskcoalition.service.ITaskAllService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;

/**
 * 任务信息Controller
 *
 * @author cl
 * @date 2024-04-10
 */
@RestController
@RequestMapping("/coalition/formation")
@Slf4j
public class TaskAllController extends BaseController {
  @Autowired private ITaskAllService taskAllService;

  /** 查询任务信息列表 */
  @PreAuthorize("@ss.hasPermi('coalition:formation:list')")
  @GetMapping("/list")
  public TableDataInfo list(TaskAll taskAll) {
    startPage();
    List<TaskAll> list = taskAllService.selectTaskAllList(taskAll);
    return getDataTable(list);
  }

  @GetMapping("/getall")
  public List<TaskAll> getAllTask() {
    return taskAllService.getAllTask();
  }

  /** 导出任务信息列表 */
  @PreAuthorize("@ss.hasPermi('coalition:formation:export')")
  @Log(title = "任务信息", businessType = BusinessType.EXPORT)
  @PostMapping("/export")
  public void export(HttpServletResponse response, TaskAll taskAll) {
    List<TaskAll> list = taskAllService.selectTaskAllList(taskAll);
    ExcelUtil<TaskAll> util = new ExcelUtil<TaskAll>(TaskAll.class);
    util.exportExcel(response, list, "任务信息数据");
  }

  /** 获取任务信息详细信息 */
  @PreAuthorize("@ss.hasPermi('coalition:formation:query')")
  @GetMapping(value = "/{id}")
  public AjaxResult getInfo(@PathVariable("id") Long id) {
    return success(taskAllService.selectTaskAllById(id));
  }

  /** 新增任务信息 */
  @PreAuthorize("@ss.hasPermi('coalition:formation:add')")
  @Log(title = "任务信息", businessType = BusinessType.INSERT)
  @PostMapping
  public AjaxResult add(@RequestBody TaskAll taskAll) {
    taskAll.setArrivalTime(new Date());
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    LoginUser userLogin = (LoginUser) authentication.getPrincipal();
    taskAll.setCompanyId(userLogin.getUserId().intValue());
    return toAjax(taskAllService.insertTaskAll(taskAll));
  }

  /** 修改任务信息 */
  @PreAuthorize("@ss.hasPermi('coalition:formation:edit')")
  @Log(title = "任务信息", businessType = BusinessType.UPDATE)
  @PutMapping
  public AjaxResult edit(@RequestBody TaskAll taskAll) {
    return toAjax(taskAllService.updateTaskAll(taskAll));
  }

  /** 删除任务信息 */
  @PreAuthorize("@ss.hasPermi('coalition:formation:remove')")
  @Log(title = "任务信息", businessType = BusinessType.DELETE)
  @DeleteMapping("/{ids}")
  public AjaxResult remove(@PathVariable Long[] ids) {
    return toAjax(taskAllService.deleteTaskAllByIds(ids));
  }

  @GetMapping("/getProductName")
  public String getProductNameById(Integer id) {
    return taskAllService.getProductNameById(id);
  }

  @GetMapping("/getone")
  public TaskAll getOne(Integer id) {
    return taskAllService.getOne(id);
  }
}

package com.ruoyi.web.controller.system;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.Zhaopin;
import com.ruoyi.system.service.IZhaopinService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 【请填写功能名称】Controller
 * 
 * @author ruoyi
 * @date 2023-03-29
 */
@Controller
@RequestMapping("/system/zhaopin")
public class ZhaopinController extends BaseController
{
    private String prefix = "system/zhaopin";

    @Autowired
    private IZhaopinService zhaopinService;

    @RequiresPermissions("system:zhaopin:view")
    @GetMapping()
    public String zhaopin()
    {
        return prefix + "/zhaopin";
    }

    /**
     * 查询【请填写功能名称】列表
     */
    @RequiresPermissions("system:zhaopin:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Zhaopin zhaopin)
    {
        startPage();
        List<Zhaopin> list = zhaopinService.selectZhaopinList(zhaopin);
        return getDataTable(list);
    }

    /**
     * 导出【请填写功能名称】列表
     */
    @RequiresPermissions("system:zhaopin:export")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Zhaopin zhaopin)
    {
        List<Zhaopin> list = zhaopinService.selectZhaopinList(zhaopin);
        ExcelUtil<Zhaopin> util = new ExcelUtil<Zhaopin>(Zhaopin.class);
        return util.exportExcel(list, "【请填写功能名称】数据");
    }

    /**
     * 新增【请填写功能名称】
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存【请填写功能名称】
     */
    @RequiresPermissions("system:zhaopin:add")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Zhaopin zhaopin)
    {
        return toAjax(zhaopinService.insertZhaopin(zhaopin));
    }

    /**
     * 修改【请填写功能名称】
     */
    @RequiresPermissions("system:zhaopin:edit")
    @GetMapping("/edit/{jobId}")
    public String edit(@PathVariable("jobId") Long jobId, ModelMap mmap)
    {
        Zhaopin zhaopin = zhaopinService.selectZhaopinByJobId(jobId);
        mmap.put("zhaopin", zhaopin);
        return prefix + "/edit";
    }

    /**
     * 修改保存【请填写功能名称】
     */
    @RequiresPermissions("system:zhaopin:edit")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Zhaopin zhaopin)
    {
        return toAjax(zhaopinService.updateZhaopin(zhaopin));
    }

    /**
     * 删除【请填写功能名称】
     */
    @RequiresPermissions("system:zhaopin:remove")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(zhaopinService.deleteZhaopinByJobIds(ids));
    }
}

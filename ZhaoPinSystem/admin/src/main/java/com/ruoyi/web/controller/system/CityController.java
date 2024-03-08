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
import com.ruoyi.system.domain.City;
import com.ruoyi.system.service.ICityService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 【请填写功能名称】Controller
 * 
 * @author ruoyi
 * @date 2023-05-07
 */
@Controller
@RequestMapping("/system/city")
public class CityController extends BaseController
{
    private String prefix = "system/city";
    private String prefix1 = "system/city/beijing";
    private String prefix2 = "system/city/guangzhou";
    private String prefix3 = "system/city/shanghai";

    @Autowired
    private ICityService cityService;

    @RequiresPermissions("system:city:view")
    @GetMapping()
    public String city()
    {
        return prefix + "/city";
    }
    @RequiresPermissions("system:city:view")
    @GetMapping("/city/beijing")
    public String city1()
    {
        return prefix1 + "/beijing";
    }
    @RequiresPermissions("system:city:view")
    @GetMapping("/city/guangzhou")
    public String city2()
    {
        return prefix2 + "/guangzhou";
    }
    @RequiresPermissions("system:city:view")
    @GetMapping("/city/shanghai")
    public String city3()
    {
        return prefix3 + "/shanghai";
    }

    /**
     * 查询【请填写功能名称】列表
     */
    @RequiresPermissions("system:city:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(City city)
    {
        startPage();
        List<City> list = cityService.selectCityList(city);
        return getDataTable(list);
    }


    /**
     * 导出【请填写功能名称】列表
     */
    @RequiresPermissions("system:city:export")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(City city)
    {
        List<City> list = cityService.selectCityList(city);
        ExcelUtil<City> util = new ExcelUtil<City>(City.class);
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
    @RequiresPermissions("system:city:add")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(City city)
    {
        return toAjax(cityService.insertCity(city));
    }

    /**
     * 修改【请填写功能名称】
     */
    @RequiresPermissions("system:city:edit")
    @GetMapping("/edit/{cityId}")
    public String edit(@PathVariable("cityId") Long cityId, ModelMap mmap)
    {
        City city = cityService.selectCityByCityId(cityId);
        mmap.put("city", city);
        return prefix + "/edit";
    }

    /**
     * 修改保存【请填写功能名称】
     */
    @RequiresPermissions("system:city:edit")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(City city)
    {
        return toAjax(cityService.updateCity(city));
    }

    /**
     * 删除【请填写功能名称】
     */
    @RequiresPermissions("system:city:remove")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(cityService.deleteCityByCityIds(ids));
    }
}

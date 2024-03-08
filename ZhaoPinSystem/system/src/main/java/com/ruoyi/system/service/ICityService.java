package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.City;

/**
 * 【请填写功能名称】Service接口
 * 
 * @author ruoyi
 * @date 2023-05-07
 */
public interface ICityService 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param cityId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public City selectCityByCityId(Long cityId);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param city 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<City> selectCityList(City city);

    /**
     * 新增【请填写功能名称】
     * 
     * @param city 【请填写功能名称】
     * @return 结果
     */
    public int insertCity(City city);

    /**
     * 修改【请填写功能名称】
     * 
     * @param city 【请填写功能名称】
     * @return 结果
     */
    public int updateCity(City city);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param cityIds 需要删除的【请填写功能名称】主键集合
     * @return 结果
     */
    public int deleteCityByCityIds(String cityIds);

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param cityId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteCityByCityId(Long cityId);
}

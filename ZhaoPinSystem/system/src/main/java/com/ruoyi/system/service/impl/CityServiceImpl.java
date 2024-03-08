package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.CityMapper;
import com.ruoyi.system.domain.City;
import com.ruoyi.system.service.ICityService;
import com.ruoyi.common.core.text.Convert;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-05-07
 */
@Service
public class CityServiceImpl implements ICityService 
{
    @Autowired
    private CityMapper cityMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param cityId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    @Override
    public City selectCityByCityId(Long cityId)
    {
        return cityMapper.selectCityByCityId(cityId);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param city 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<City> selectCityList(City city)
    {
        return cityMapper.selectCityList(city);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param city 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertCity(City city)
    {
        return cityMapper.insertCity(city);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param city 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateCity(City city)
    {
        return cityMapper.updateCity(city);
    }

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param cityIds 需要删除的【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteCityByCityIds(String cityIds)
    {
        return cityMapper.deleteCityByCityIds(Convert.toStrArray(cityIds));
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param cityId 【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteCityByCityId(Long cityId)
    {
        return cityMapper.deleteCityByCityId(cityId);
    }
}

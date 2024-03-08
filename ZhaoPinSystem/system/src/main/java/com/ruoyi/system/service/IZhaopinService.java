package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.Zhaopin;

/**
 * 【请填写功能名称】Service接口
 * 
 * @author ruoyi
 * @date 2023-03-29
 */
public interface IZhaopinService 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param jobId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public Zhaopin selectZhaopinByJobId(Long jobId);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param zhaopin 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<Zhaopin> selectZhaopinList(Zhaopin zhaopin);

    /**
     * 新增【请填写功能名称】
     * 
     * @param zhaopin 【请填写功能名称】
     * @return 结果
     */
    public int insertZhaopin(Zhaopin zhaopin);

    /**
     * 修改【请填写功能名称】
     * 
     * @param zhaopin 【请填写功能名称】
     * @return 结果
     */
    public int updateZhaopin(Zhaopin zhaopin);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param jobIds 需要删除的【请填写功能名称】主键集合
     * @return 结果
     */
    public int deleteZhaopinByJobIds(String jobIds);

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param jobId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteZhaopinByJobId(Long jobId);
}

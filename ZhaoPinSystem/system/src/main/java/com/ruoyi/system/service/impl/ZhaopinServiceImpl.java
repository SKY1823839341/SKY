package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.ZhaopinMapper;
import com.ruoyi.system.domain.Zhaopin;
import com.ruoyi.system.service.IZhaopinService;
import com.ruoyi.common.core.text.Convert;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-03-29
 */
@Service
public class ZhaopinServiceImpl implements IZhaopinService 
{
    @Autowired
    private ZhaopinMapper zhaopinMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param jobId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    @Override
    public Zhaopin selectZhaopinByJobId(Long jobId)
    {
        return zhaopinMapper.selectZhaopinByJobId(jobId);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param zhaopin 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<Zhaopin> selectZhaopinList(Zhaopin zhaopin)
    {
        return zhaopinMapper.selectZhaopinList(zhaopin);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param zhaopin 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertZhaopin(Zhaopin zhaopin)
    {
        zhaopin.setCreateTime(DateUtils.getNowDate());
        return zhaopinMapper.insertZhaopin(zhaopin);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param zhaopin 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateZhaopin(Zhaopin zhaopin)
    {
        return zhaopinMapper.updateZhaopin(zhaopin);
    }

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param jobIds 需要删除的【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteZhaopinByJobIds(String jobIds)
    {
        return zhaopinMapper.deleteZhaopinByJobIds(Convert.toStrArray(jobIds));
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param jobId 【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteZhaopinByJobId(Long jobId)
    {
        return zhaopinMapper.deleteZhaopinByJobId(jobId);
    }
}

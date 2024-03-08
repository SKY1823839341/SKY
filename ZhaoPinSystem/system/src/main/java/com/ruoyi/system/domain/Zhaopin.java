package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 zhaopin
 * 
 * @author ruoyi
 * @date 2023-03-29
 */
public class Zhaopin extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 岗位id */
    private Long jobId;

    /** 岗位名 */
    @Excel(name = "岗位名")
    private String jobName;

    /** 薪资水平(高减低) */
    @Excel(name = "薪资水平(高减低)")
    private Long jobSalary;

    /** 目前状态 */
    @Excel(name = "目前状态")
    private String status;

    /** 所属公司 */
    @Excel(name = "所属公司")
    private String jobCompany;

    public void setJobId(Long jobId) 
    {
        this.jobId = jobId;
    }

    public Long getJobId() 
    {
        return jobId;
    }
    public void setJobName(String jobName) 
    {
        this.jobName = jobName;
    }

    public String getJobName() 
    {
        return jobName;
    }
    public void setJobSalary(Long jobSalary) 
    {
        this.jobSalary = jobSalary;
    }

    public Long getJobSalary() 
    {
        return jobSalary;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setJobCompany(String jobCompany) 
    {
        this.jobCompany = jobCompany;
    }

    public String getJobCompany() 
    {
        return jobCompany;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("jobId", getJobId())
            .append("jobName", getJobName())
            .append("jobSalary", getJobSalary())
            .append("status", getStatus())
            .append("jobCompany", getJobCompany())
            .append("createTime", getCreateTime())
            .append("remark", getRemark())
            .toString();
    }
}

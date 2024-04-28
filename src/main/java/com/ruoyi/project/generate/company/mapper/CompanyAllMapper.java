package com.ruoyi.project.generate.company.mapper;

import com.ruoyi.project.generate.company.domain.CompanyAll;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 企业信息Mapper接口
 *
 * @author cl
 * @date 2024-04-02
 */
public interface CompanyAllMapper {
  /**
   * 查询企业信息
   *
   * @param id 企业信息主键
   * @return 企业信息
   */
  public CompanyAll selectCompanyAllById(Long id, Long layerId);

  /**
   * 查询企业信息列表
   *
   * @param companyAll 企业信息
   * @return 企业信息集合
   */
  public List<CompanyAll> selectCompanyAllList(CompanyAll companyAll);

  /**
   * 新增企业信息
   *
   * @param companyAll 企业信息
   * @return 结果
   */
  public int insertCompanyAll(CompanyAll companyAll);

  /**
   * 根据产业链网络层编号获取产业链名称
   *
   * @param id 产业链网络层编号
   * @return 产业链名称
   */
  @Select("select name from chain where layer_id = #{layer_id}")
  public String getIndustryChainNameByLayerId(Integer layer_id);

  /**
   * 修改企业信息
   *
   * @param companyAll 企业信息
   * @return 结果
   */
  public int updateCompanyAll(CompanyAll companyAll);

  /**
   * 删除企业信息
   *
   * @param id 企业信息主键
   * @return 结果
   */
  public int deleteCompanyAllById(Long id);

  /**
   * 批量删除企业信息
   *
   * @param ids 需要删除的数据主键集合
   * @return 结果
   */
  public int deleteCompanyAllByIds(Long[] ids);

  @Select("select  * from `ry-vue`.company_all where layer_id=#{layer} and id=#{id}")
  CompanyAll getOneCompany(Integer id, Integer layer);

  @Select("select  * from `ry-vue`.company_all where  id=#{id}")
  List<CompanyAll> getById(Integer id);

  List<String> getNamesByIds(List<Integer> ids);

  @Select("select * from `ry-vue`.company_all where status = 1")
  List<CompanyAll> getAllIdleCompany();

  @Select("select * from `ry-vue`.company_all where status = 2 and company_all.coalition_id =#{coalitionId}")
  List<CompanyAll> getCompanyByCoalition(Long coalitionId);

    @Select("select * from `ry-vue`.company_all")
  List<CompanyAll> getAllCompany();
}

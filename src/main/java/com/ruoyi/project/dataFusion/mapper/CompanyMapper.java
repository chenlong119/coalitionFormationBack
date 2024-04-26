package com.ruoyi.project.dataFusion.mapper;

import com.ruoyi.project.dataFusion.domain.Company2;
import com.ruoyi.project.dataFusion.domain.Group;
import com.ruoyi.project.dataFusion.domain.Link;
import com.ruoyi.project.dataFusion.domain.Relation;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

@Component("companyMapper2")
public interface CompanyMapper {

  List<Company2> getAllCompanies();

  List<Company2> getAllCompaniesWithoutLocation();

  List<Company2> getAllCompaniesWithOverAllLocation();

  List<Link> getAllLinks();

  List<Link> getOverallLinks();

  void updateCompanyCategory(@Param("companyId") int companyId, @Param("category") int category);

  List<Group> getGroupInfo();

  List<Link> getSupplyAdjacency();

  List<Link> getCompetitionAdjacency();

  List<Link> getCooperationAdjacency();

  Integer getLocationIdByCompanyId(@Param("companyId") int companyId, @Param("layer") int layer);

  void updateSupplyRelationStrength(
      @Param("source_location") int source_location,
      @Param("target_location") int target_location,
      @Param("supply_relation") double supply_relation);

  void updateCompetitionRelationStrength(
      @Param("source_location") int source_location,
      @Param("target_location") int target_location,
      @Param("competition_relation") double competition_relation);

  void updateCooperationRelationStrength(
      @Param("source_location") int source_location,
      @Param("target_location") int target_location,
      @Param("cooperation_relation") double cooperation_relation);

  List<Relation> getAllRelation();

  double selectSupplyStrength(
      @Param("source_location") int source_location, @Param("target_location") int target_location);

  double selectCooperationStrength(
      @Param("source_location") int source_location, @Param("target_location") int target_location);

  double selectCompetitionStrength(
      @Param("source_location") int source_location, @Param("target_location") int target_location);

  void updateTotalStrength(
      @Param("source_id") int source_id,
      @Param("target_id") int target_id,
      @Param("total_relation") double total_relation);

  double selectStrength(@Param("company1_id") int company1_id,@Param("company2_id") int company2_id, @Param("layer_id") int layer_id);

  void updateRelationStrength(@Param("company1_id") int company1_id,@Param("company2_id") int company2_id, @Param("strength") double strength, @Param("layer_id") int layer_id);

  List<Company2> searchSingleByName(String name);
}

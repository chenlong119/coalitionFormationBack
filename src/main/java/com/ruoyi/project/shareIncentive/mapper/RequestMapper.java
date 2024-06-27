package com.ruoyi.project.shareIncentive.mapper;
import com.ruoyi.project.shareIncentive.domain.Request;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface RequestMapper {
//    @Insert("INSERT INTO dataSharingRequests (name, description, industry_chain, data_type, target_companies) " +
//            "VALUES (#{name}, #{description}, #{industryChain}, #{dataType}, #{targetCompanies})")
    void insertDataSharingRequest(Request request);
//    @Select("SELECT * FROM dataSharingRequests")
    List<Request> findAll();

    void setFinished(Integer id);

}

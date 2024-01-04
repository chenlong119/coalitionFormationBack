package com.ruoyi.project.multimode.mapper;
import com.ruoyi.project.multimode.domain.BusinessDirection;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import java.util.List;
@Mapper
public interface BusinessDirectionMapper {

    List<BusinessDirection> findAll();

}

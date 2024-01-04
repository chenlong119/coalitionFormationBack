package com.ruoyi.project.multimode.mapper;

import com.ruoyi.project.multimode.domain.Business2;
import java.util.List;
import org.springframework.stereotype.Component;

@Component("businessMapper2")
public interface BusinessMapper {
  List<Business2> findAll();

  int countBusinessById();

  Business2 getBusinessById(String businessId);

  Business2 getBusinessName(String businessName);

  String getBusinessNameById(String businessId);
}

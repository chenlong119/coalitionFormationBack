package com.ruoyi.project.shareIncentive.contoller;

import com.ruoyi.project.shareIncentive.domain.CompanyIncomeDto;
import com.ruoyi.project.shareIncentive.domain.Request;
import com.ruoyi.project.shareIncentive.service.RequestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/request")
public class RequestController {
    @Autowired
    private RequestService requestService;


    @PostMapping("/add")
    public void addDataSharingRequest(@RequestBody Request request) {
//        System.out.println("taskname:"+request.getDataFinish());
        requestService.addDataSharingRequest(request);
    }

    @GetMapping("/all")
    public List<Request> getAllDataSharingRequests() {
        return requestService.getAllDataSharingRequests();
    }


    @GetMapping("/finishRequest/{id}")
    public void finishRequest(@PathVariable Integer id){

        requestService.finishRequest(id);
    }

    @PostMapping("/updateCompanyIncome")
    public void updateCompany(@RequestBody CompanyIncomeDto companyIncomeDto){
        requestService.updateCompanyIncome(companyIncomeDto);
    }
}

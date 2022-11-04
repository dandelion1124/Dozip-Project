package com.dozip.service.partners.myInterior;

import com.dozip.dao.partners.myInterior.MyInteriorDAO;
import com.dozip.service.partners.myEstimate.MyEstimateService;
import com.dozip.vo.ContractVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MyInteriorServiceImpl implements MyInteriorService {
    @Autowired
    MyInteriorDAO myInteriorDAO;

    @Override
    public List<ContractVO> getContract_interior(String businessNum) {return myInteriorDAO.getContract_interior(businessNum);}
    @Override
    public ContractVO show_contract(String cont_no) {
        return myInteriorDAO.show_contract(cont_no);
    }

}

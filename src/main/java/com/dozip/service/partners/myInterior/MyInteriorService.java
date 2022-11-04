package com.dozip.service.partners.myInterior;

import com.dozip.vo.ContractVO;

import java.util.List;

public interface MyInteriorService {
    List<ContractVO> getContract_interior(String businessNum);
    ContractVO show_contract(String cont_no);

}

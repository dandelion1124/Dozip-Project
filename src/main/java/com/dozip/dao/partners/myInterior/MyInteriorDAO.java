package com.dozip.dao.partners.myInterior;

import com.dozip.vo.ContractVO;

import java.util.List;

public interface MyInteriorDAO {
    List<ContractVO> getContract_interior(String businessNum);
    ContractVO show_contract(String cont_no);


}

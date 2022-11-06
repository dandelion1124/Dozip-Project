package com.dozip.dao.partners.myInterior;

import com.dozip.vo.ContractVO;

import java.util.List;

public interface MyInteriorDAO {
    List<ContractVO> getContract_interior(ContractVO vo);
    ContractVO show_contract(String cont_no);


    List<ContractVO> getschedule(String businessNum); //달력에 등록할 공사일정 불러오기

    int regit_schedule(String cont_no); //달력에 일정 등록
}

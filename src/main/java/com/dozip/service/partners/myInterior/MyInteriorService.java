package com.dozip.service.partners.myInterior;

import com.dozip.vo.ContractVO;

import java.util.List;

public interface MyInteriorService {
    List<ContractVO> getContract_interior(ContractVO vo);
    ContractVO show_contract(String cont_no);
    
    List<ContractVO> getschedule(String businessNum);    //달력에 등록할 공사 일정 불러오기
    int regit_schedule(String cont_no);  //계약서번호에 해당하는 일정 달력에 등록하기
}

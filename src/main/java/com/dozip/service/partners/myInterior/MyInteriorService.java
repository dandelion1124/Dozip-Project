package com.dozip.service.partners.myInterior;

import com.dozip.vo.ContractVO;
import com.dozip.vo.PayVO;

import java.util.List;

public interface MyInteriorService {
    List<ContractVO> getContract_interior(ContractVO vo);
    ContractVO show_contract(String cont_no);
    
    List<ContractVO> getschedule(String businessNum);    //달력에 등록할 공사 일정 불러오기
    int regit_schedule(String cont_no);  //계약서번호에 해당하는 일정 달력에 등록하기

    List<PayVO> getBalance(PayVO vo); //시공완료 정산내역 불러오기

    PayVO totalBalance(PayVO vo); // 시공완료 정산내역 합계 불러오기

    List<PayVO> getBalance_ing(PayVO vo); //시공중 정산내역 불러오기

    PayVO totalBalance_ing(PayVO vo); // 시공중 정산내역 합계 불러오기

    List<ContractVO> getContractList_port(String businessNum);

    List<PayVO> monthly_balance(PayVO vo); //시공완료  월별 정산상세내역 불러오기

    List<PayVO> monthly_balance_ing(PayVO vo); //시공중  월별 정산상세내역 불러오기
}

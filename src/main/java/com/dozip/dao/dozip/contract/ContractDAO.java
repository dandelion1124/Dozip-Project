package com.dozip.dao.dozip.contract;

import com.dozip.vo.ContractVO;

import java.util.List;

public interface ContractDAO {
    int getCListCount(String mem_id); //계약서 개수
    List<ContractVO> getContList(ContractVO c); //계약서 목록
    ContractVO getCont(String cont_no); //계약서 정보
    void updateCustomerNum(ContractVO c); // 계약동의
}

package com.dozip.service.dozip.contract;

import com.dozip.vo.ContractVO;

import java.util.List;

public interface ContractService {
    int getCListCount(String mem_id); //계약서 개수
    List<ContractVO> getContList(ContractVO c); //계약서 목록
    ContractVO getCont(String cont_no); //계약서 정보
    void contractOK(ContractVO c); //계약동의
}

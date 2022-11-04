package com.dozip.service.partners.customer;

import com.dozip.vo.QnaVO;

import java.util.List;

public interface CustomerService {
    int getListCount(QnaVO findQ);

    List<QnaVO> getQnaList(QnaVO findQ);
    int insertQna(QnaVO qdto);
    int deleteReply(QnaVO dv);
    int selqnaRef(QnaVO dv);
    void returnState(QnaVO dv);


}

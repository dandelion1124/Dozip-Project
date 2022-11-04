package com.dozip.dao.partners.customer;

import com.dozip.vo.QnaVO;

import java.util.List;

public interface CustomerDAO {
    int getListCount(QnaVO findQ);
    List<QnaVO> getQnaList(QnaVO findQ);
    int insertQna(QnaVO qdto);
    void updateLevel(QnaVO qdto);
    void updateState(QnaVO qdto);
    int deleteReply(QnaVO dv);
    int selqnaRef(QnaVO dv);
    void returnState(QnaVO dv);


}

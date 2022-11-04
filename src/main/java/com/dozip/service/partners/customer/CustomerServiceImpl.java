package com.dozip.service.partners.customer;

import com.dozip.dao.partners.customer.CustomerDAO;
import com.dozip.vo.QnaVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService{
    @Autowired
    CustomerDAO customerDAO;

    @Override
    public int getListCount(QnaVO findQ) {
        return customerDAO.getListCount(findQ);
    }
    @Override
    public List<QnaVO> getQnaList(QnaVO findQ) {
        return customerDAO.getQnaList(findQ);
    }
    @Transactional
    @Override
    public int insertQna(QnaVO qdto) {
        customerDAO.updateLevel(qdto); //답변글 레벨증가
        customerDAO.updateState(qdto); //원본글 state 답변완료로 변경
        return customerDAO.insertQna(qdto);
    }//답변레벨증가+답변저장=>트랜잭션 적용 대상

    @Override
    public int deleteReply(QnaVO dv) {
        return customerDAO.deleteReply(dv);
    }
    @Override
    public int selqnaRef(QnaVO dv) {
        return customerDAO.selqnaRef(dv);
    }
    @Override
    public void returnState(QnaVO dv) {
        customerDAO.returnState(dv);
    }
}

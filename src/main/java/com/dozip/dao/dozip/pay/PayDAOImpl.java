package com.dozip.dao.dozip.pay;

import com.dozip.vo.ContractVO;
import com.dozip.vo.PayVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PayDAOImpl implements PayDAO{
    @Autowired
    private SqlSession sqlSession;

    @Override //결제테이블 생성
    public void insertPay(ContractVO c) {
        this.sqlSession.insert("in_pay", c);
    }
    @Override //결제정보
    public PayVO getPay(String cont_no) {
        return this.sqlSession.selectOne("get_pay", cont_no);
    }
    @Override //결제상태 변경
    public int payState(PayVO p) {
        return this.sqlSession.update("pay_state", p);
    }
    @Override //해당일자가 되면 요청상태로 변경
    public void updateState() {
        List<String> list = this.sqlSession.selectList("get_conNo");
        System.out.println(list.toString());
        this.sqlSession.update("second_State",list);
        this.sqlSession.update("third_State",list);
    }
    @Override //결제요청상태 확인
    public List<PayVO> requestPay(String mem_id) {
        return this.sqlSession.selectList("request_state", mem_id);
    }
    @Override
    public int check() {
        return this.sqlSession.selectOne("null_check");
    }
}

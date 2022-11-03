package com.dozip.dao.dozip.bid;

import com.dozip.vo.BidVO;
import com.dozip.vo.ContractVO;
import com.dozip.vo.PayVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BidDAOImpl implements BidDAO{
    @Autowired
    private SqlSession sqlSession;

    @Override //입찰 리스트
    public List<BidVO> getBidList(String est_num) {
        return this.sqlSession.selectList("bid_list", est_num);
    }
    @Override //입찰번호 확인
    public String getBidNum(ContractVO c) {
        return this.sqlSession.selectOne("get_bNum", c);
    }
    @Override //입찰 상태변경
    public void updateState(BidVO b) {
        this.sqlSession.update("state_up", b);
    }
    @Override //입찰 상태변경(거절)
    public void updateState2(String est_num) {
        this.sqlSession.update("state_down", est_num);
    }
    @Override //입찰내용
    public BidVO getEnum(String bid_num) {
        return this.sqlSession.selectOne("find_B", bid_num);
    }
    @Override //입찰거절
    public void updateReject(String bid_num) {
        this.sqlSession.update("bid_reject", bid_num);
    }



}

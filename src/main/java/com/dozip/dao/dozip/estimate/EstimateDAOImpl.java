package com.dozip.dao.dozip.estimate;

import com.dozip.vo.BidVO;
import com.dozip.vo.ContractVO;
import com.dozip.vo.EstimateVO;
import com.dozip.vo.PayVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class EstimateDAOImpl implements EstimateDAO {
    @Autowired
    private SqlSession sqlSession;

    @Override //견적서(지정) 개수확인
    public int getPListCount(String mem_id) {
        return this.sqlSession.selectOne("p_count", mem_id);
    }
    @Override //견적서(입찰) 개수확인
    public int getListCount(String mem_id) {
        return this.sqlSession.selectOne("e_count", mem_id);
    }
    @Override //견적서(지정) 리스트
    public List<EstimateVO> getPElist(EstimateVO e) {
        return this.sqlSession.selectList("p_list", e);
    }
    @Override //견적서(입찰) 리스트
    public List<EstimateVO> getElist(EstimateVO e) {
        return this.sqlSession.selectList("e_list", e);
    }
    @Override //견적서 상태변경
    public void updateEstate(EstimateVO e) {
        this.sqlSession.update("est_state", e);
    }
    @Override //견적내용 입찰내용으로 업데이트
    public void updateBtoE(BidVO b) {
        this.sqlSession.update("bid_to_est", b);
    }
    @Override //견적서(입찰) 번호 리스트
    public List<String> getEstNum(String mem_id) {
        return this.sqlSession.selectList("est_num", mem_id);
    }
}

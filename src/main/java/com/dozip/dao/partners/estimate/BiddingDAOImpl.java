package com.dozip.dao.partners.estimate;

import com.dozip.service.partners.estimate.BiddingService;
import com.dozip.vo.BidVO;
import com.dozip.vo.EstimateVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BiddingDAOImpl implements BiddingDAO {
    @Autowired
    SqlSession sqlSession;

    @Override //estimate 테이블에 있는 db 전부 가져오기
    public List<EstimateVO> selectEstimateList() { return sqlSession.selectList("select_estdata"); }
    @Override
    public EstimateVO selectEstimate(String bid_no) {
        return sqlSession.selectOne("select_est",bid_no);
    }
    @Override // 해당 입찰 신청한 파트너스 수 가져오기
    public int countBid(String est_num){ return sqlSession.selectOne("count_bid",est_num); }
    @Override
    public int checkBid(BidVO b) {
        return this.sqlSession.selectOne("check_bid",b);
    }
    /* bid_detail_ok */
    @Override //입찰신청하기 입찰 DB에 insert
    public void insertbid(BidVO bid) {
        sqlSession.insert("insert_bid_detail",bid);
    }
    @Override
    public int getBlistCount2(String businessNum) {
        return this.sqlSession.selectOne("my_bid_count",businessNum);
    }
    @Override
    public List<BidVO> selectJoinList(EstimateVO e) {
        return this.sqlSession.selectList("sel_All", e);
    }

    @Override
    public BidVO countJoinpartners(BidVO b) {
        return this.sqlSession.selectOne("count_partners",b);
    }

}

package com.dozip.dao;

import com.dozip.vo.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PartnersDAOImpl implements PartnersDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public PartnersVO getPartnersInfo(String pId) {
        return sqlSession.selectOne("partners_info", pId);
    }//파트너스 정보조회

    @Override
    public void addPortfolio(PortfolioVO pv) {
        sqlSession.insert("portfolio_in", pv);
    }//포트폴리오 등록

    @Override
    public int getPort_num(PortfolioVO pv) {
        return sqlSession.selectOne("portfolio_num", pv);
    } //포트폴리오 사진 등록을위한 포트폴리오 번호 조회
    @Override
    public void insertPartners(PartnersVO pv) {
        sqlSession.insert("partners_in",pv);
    }//파트너스 회원가입
    @Override
    public PartnersVO getPartnersInfo2(String findid_business_num) {
        return sqlSession.selectOne("findinfo_id",findid_business_num);
    }//사업자 번호 기준 정보 조회
    @Override
    public void insertPort_Photos(PortfolioVO pv) {
        sqlSession.insert("insert_photo",pv);
    }
    @Override
    public int getListCount(QnaVO findQ) {
        return sqlSession.selectOne("qna_count",findQ);
    }
    @Override
    public void updateState(QnaVO qdto) {
        sqlSession.update("change_state",qdto);
    }
    @Override
    public void updateLevel(QnaVO qdto) {
        sqlSession.update("reply_levelUp",qdto);
    }
    @Override
    public int insertQna(QnaVO qdto) {
        return sqlSession.insert("partners_reply_in", qdto);
    }
    @Override
    public int deleteReply(QnaVO dv) {
        return sqlSession.delete("del_reply",dv);
    }
    @Override
    public int selqnaRef(QnaVO dv) {
        return sqlSession.selectOne("sel_qnaRef", dv);
    }
    @Override
    public void returnState(QnaVO dv) {
        sqlSession.update("returnState", dv);
    }
    @Override
    public int checkBusinessNum(PartnersVO pv) {
        return sqlSession.selectOne("check_bnum",pv);
    }
    @Override
    public List<QnaVO> getQnaList(QnaVO findQ) {
        return sqlSession.selectList("partners_qna_list", findQ);
    }


    /* minwoo */
    @Override
    public PartnersVO getMember(String businessNum) {
        return sqlSession.selectOne("select_data",businessNum);
    }

    @Override
    public Partners_subVO getPartnersSub(String businessNum) {
        return sqlSession.selectOne("select_subdata",businessNum);
    }
    @Override
    public void updatePartnersSub(Partners_subVO ps) {
        sqlSession.update("update_subdata",ps);
    }

    @Override
    public void updatePartners(PartnersVO p) { sqlSession.update("update_data",p); }

    @Override
    public void insertPartnersSub(Partners_subVO ps) {
        sqlSession.insert("insert_subdata",ps);
    }

    @Override
    public List<EstimateVO> selectEstimateList() {
        return sqlSession.selectList("select_estdata");
    }

    @Override
    public int checkSub(String businessNum) {
        return sqlSession.selectOne("res_check",businessNum);
    }

    @Override
    public List<EstimateVO> getAllEstList() {
        return sqlSession.selectList("est_list");
    }
//    @Override
//    public void checkremaindate(EstimateVO vo) {
//        sqlSession.selectOne("check_date");
//    }

    @Override
    public List<BidVO> getBidList() {
        return sqlSession.selectList("est_list2");
    }

    @Override
    public EstimateVO write_contract(int est_num) {
        return sqlSession.selectOne("write_contract",est_num);
    }

    @Override
    public void insertContract(ContractVO cv) {
        sqlSession.insert("contract_in",cv);
    }
    @Override
    public EstimateVO selectEstimate(String bid_no) {
        return sqlSession.selectOne("select_est",bid_no);
    }

    @Override
    public void insertbid(BidVO bid) {
        sqlSession.insert("insert_bid_detail",bid);
    }
}



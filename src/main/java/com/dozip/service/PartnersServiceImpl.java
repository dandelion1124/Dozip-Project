package com.dozip.service;

import com.dozip.dao.PartnersDAO;
import com.dozip.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class PartnersServiceImpl implements PartnersService {
    @Autowired
    private PartnersDAO partnersDao;

    @Override
    public PartnersVO getPartnersInfo(String pId) {
        return partnersDao.getPartnersInfo(pId);
    }
    @Override
    public int addPortfolio(PortfolioVO pv) {
        partnersDao.addPortfolio(pv);
        return partnersDao.getPort_num(pv); //수정작업 필요 . 가끔2개가 조회됨
    }

    @Override
    public void insertPartners(PartnersVO pv) {
        partnersDao.insertPartners(pv);
    }
    @Override
    public PartnersVO getPartnersInfo2(String findid_business_num) {
        return partnersDao.getPartnersInfo2(findid_business_num);
    }
    @Override
    public void insertPort_Photos(PortfolioVO pv) {
        partnersDao.insertPort_Photos(pv);
    }
    @Override
    public int getListCount(QnaVO findQ) {
        return partnersDao.getListCount(findQ);
    }
    @Override
    public List<QnaVO> getQnaList(QnaVO findQ) {
        return partnersDao.getQnaList(findQ);
    }
    @Transactional
    @Override
    public int insertQna(QnaVO qdto) {
        partnersDao.updateLevel(qdto); //답변글 레벨증가
        partnersDao.updateState(qdto); //원본글 state 답변완료로 변경
        return partnersDao.insertQna(qdto);
    }//답변레벨증가+답변저장=>트랜잭션 적용 대상
    @Override
    public int deleteReply(QnaVO dv) {
        return partnersDao.deleteReply(dv);
    }
    @Override
    public int selqnaRef(QnaVO dv) {
        return partnersDao.selqnaRef(dv);
    }
    @Override
    public void returnState(QnaVO dv) {
        partnersDao.returnState(dv);
    }
    @Override
    public int checkBusinessNum(PartnersVO pv) {
        return partnersDao.checkBusinessNum(pv);
    }


    /* minwoo */
    /* My page */
    @Override
    public PartnersVO getMember(String businessNum) {
        return this.partnersDao.getMember(businessNum);
    }
    @Override
    public Partners_subVO getPartnersSub(String businessNum) {
        return partnersDao.getPartnersSub(businessNum);
    }
    @Override
    public void insertPartnersSub(Partners_subVO ps) {
        partnersDao.insertPartnersSub(ps);
    }
    @Override
    public void updatePartnersSub(Partners_subVO ps) {
        partnersDao.updatePartnersSub(ps);
    }
    @Override
    public void updatePartners(PartnersVO p) { partnersDao.updatePartners(p); }
    @Override
    public int checkSub(String businessNum) {
        return partnersDao.checkSub(businessNum);
    }
    /* bid */
    @Override
    public List<EstimateVO> selectEstimateList() { return partnersDao.selectEstimateList(); }
    @Override
    public EstimateVO selectEstimate(String bid_no) {
        return partnersDao.selectEstimate(bid_no);
    }
    @Override
    public int countBid(String est_num) { return partnersDao.countBid(est_num); }
    @Override
    public int checkBid(BidVO b) {
        return partnersDao.checkBid(b);
    }
    /* bid_detail_ok */
    @Override
    public void insertbid(BidVO bid) {
        partnersDao.insertbid(bid);
    }
    @Override
    public List<BidVO> selectJoinList(EstimateVO e) {
        return this.partnersDao.selectJoinList(e);
    }
    /* construct_request */
    @Override
    public List<EstimateVO> selectEstimateListBnum(String businessNum) { return this.partnersDao.selectEstimateListBnum(businessNum); }
    @Override
    public int getBlistCount2(String businessNum) {
        return partnersDao.getBlistCount2(businessNum);
    }

    @Override
    public int getElistCount(String businessNum) {
        return partnersDao.getElistCount(businessNum);
    }


    @Override
    public List<EstimateVO> getAllEstList() {
        return partnersDao.getAllEstList();
    }
    @Override
    public List<BidVO> getBidList() {
        return partnersDao.getBidList();
    }
    @Override
    public EstimateVO write_contract(int est_num){
        return partnersDao.write_contract(est_num);
    }

    @Transactional
    @Override
    public int insertContract(ContractVO cv) {
        partnersDao.updateEstimate(cv);
        return partnersDao.insertContract(cv);
    }

    @Override
    public BidVO getOneBid(String est_num) {
        return partnersDao.getOneBid(est_num);
    }

    @Override
    public EstimateVO getOneEst(String est_num) {
        return partnersDao.getOneEst(est_num);
    }
}


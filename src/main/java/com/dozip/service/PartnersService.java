package com.dozip.service;


import com.dozip.vo.*;

import java.util.List;

public interface PartnersService {
    PartnersVO getPartnersInfo(String pId);
    int addPortfolio(PortfolioVO pv);
    void insertPartners(PartnersVO pv);
    PartnersVO getPartnersInfo2(String findid_business_num);
    void insertPort_Photos(PortfolioVO pv);
    int getListCount(QnaVO findQ);
    List<QnaVO> getQnaList(QnaVO findQ);
    int insertQna(QnaVO qdto);
    int deleteReply(QnaVO dv);
    int selqnaRef(QnaVO dv);
    void returnState(QnaVO dv);
    int checkBusinessNum(PartnersVO pv);

    /*minwoo*/
    /* My page */
    PartnersVO getMember(String businessNum); //data_manage 회원정보 가져오기
    Partners_subVO getPartnersSub(String businessNum);
    void insertPartnersSub(Partners_subVO ps);
    void updatePartnersSub(Partners_subVO ps);//data_manage sub회원정보 추가/수정
    void updatePartners(PartnersVO p);//data_manage 회원정보 추가/수정(address)
    int checkSub(String businessNum);
    /* bid */
    List<EstimateVO> selectEstimateList(); //estimate 테이블에 있는 db 전부 가져오기
    EstimateVO selectEstimate(String bid_no); // bid, bid_detail, bid_detail_ok
    int countBid(String est_num);
    int checkBid(BidVO b); //입찰했는지 확인하는것
    /* bid_detail_ok */
    void insertbid(BidVO bid);
    List<BidVO> selectJoinList(EstimateVO e);
    /* construct_request */
    List<EstimateVO> selectEstimateListBnum(String businessNum);
    int getBlistCount2(String businessNum);
    int getElistCount(String businessNum);


    List<EstimateVO> getAllEstList();
    List<BidVO> getBidList();
    EstimateVO write_contract(int est_num);
    int insertContract(ContractVO cv);
    BidVO getOneBid(String est_num);

    EstimateVO getOneEst(String est_num);


}

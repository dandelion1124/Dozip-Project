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
    PartnersVO getMember(String businessNum); //data_manage 회원정보 가져오기
    Partners_subVO getPartnersSub(String businessNum);
    void updatePartnersSub(Partners_subVO ps);//data_manage sub회원정보 추가/수정
    void updatePartners(PartnersVO p);//data_manage 회원정보 추가/수정(address)
    void insertPartnersSub(Partners_subVO ps);
    List<EstimateVO> selectEstimateList();

    int checkSub(String businessNum);
    List<EstimateVO> getAllEstList();
    List<BidVO> getBidList();
    EstimateVO write_contract(int est_num);
    void insertContract(ContractVO cv);
    EstimateVO selectEstimate(String bid_no);

    void insertbid(BidVO bid);

    List<BidVO> selectBidList();

    List<BidVO> selectJoinList(String businessNum);

    List<EstimateVO> selectEstimateListBnum(String businessNum);
}

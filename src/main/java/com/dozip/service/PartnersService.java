package com.dozip.service;


import com.dozip.vo.PartnersVO;
import com.dozip.vo.Partners_subVO;
import com.dozip.vo.PortfolioVO;
import com.dozip.vo.QnaVO;

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

    void updatePartnersSub(String businessNum);//data_manage sub회원정보 추가/수정

    void updatePartners(String businessNum);//data_manage 회원정보 추가/수정(address)

    void insertPartnersSub(String businessNum);
}

package com.dozip.dao;

import com.dozip.vo.PartnersVO;
import com.dozip.vo.Partners_subVO;
import com.dozip.vo.PortfolioVO;
import com.dozip.vo.QnaVO;

import java.util.List;

public interface PartnersDAO {
    PartnersVO getPartnersInfo(String pId);
    void addPortfolio(PortfolioVO pv);
    int getPort_num(PortfolioVO pv);

    void insertPartners(PartnersVO pv);
    PartnersVO getPartnersInfo2(String findid_business_num);
    void insertPort_Photos(PortfolioVO pv);


    int getListCount(QnaVO findQ);
    List<QnaVO> getQnaList(QnaVO findQ);
    void updateLevel(QnaVO qdto);
    void updateState(QnaVO qdto);
    int insertQna(QnaVO qdto);
    int deleteReply(QnaVO dv);
    int selqnaRef(QnaVO dv);
    void returnState(QnaVO dv);
    int checkBusinessNum(PartnersVO pv);


    /* minwoo */
    PartnersVO getMember(String businessNum); //data_manage 회원정보

    Partners_subVO getPartnersSub(String businessNum);

    void updatePartners(String businessNum);
}


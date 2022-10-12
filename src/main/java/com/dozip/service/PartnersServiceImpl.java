package com.dozip.service;

import com.dozip.dao.PartnersDAO;
import com.dozip.vo.PartnersVO;
import com.dozip.vo.Partners_subVO;
import com.dozip.vo.PortfolioVO;
import com.dozip.vo.QnaVO;
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
    public PartnersVO getMember(String businessNum) {
        return this.partnersDao.getMember(businessNum);
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
    public Partners_subVO getPartnersSub(String businessNum) {
        return partnersDao.getPartnersSub(businessNum);
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
}


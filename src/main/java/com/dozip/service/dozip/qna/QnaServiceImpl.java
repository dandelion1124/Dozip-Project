package com.dozip.service.dozip.qna;

import com.dozip.dao.dozip.qna.QnaDAO;
import com.dozip.vo.QnaVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QnaServiceImpl implements QnaService{
    @Autowired
    private QnaDAO qnaDAO;

    @Override //문의글(관리자) 개수확인
    public int getListCount(String id) {
        return this.qnaDAO.getListCount(id);
    }
    @Override //문의글(업체) 개수확인
    public int getPListCount(String id) {
        return this.qnaDAO.getPListCount(id);
    }
    @Override //문의글(업체) 리스트
    public List<QnaVO> getPlist(QnaVO q) {
        return this.qnaDAO.getPlist(q);
    }
    @Override //문의글(관리자) 리스트
    public List<QnaVO> getQlist(QnaVO q) {
        return this.qnaDAO.getQlist(q);
    }
    @Override //businessNum 확인
    public String getBnum(String businessName) {
        return this.qnaDAO.getBnum(businessName);
    }
    @Override //문의글 등록
    public void insertQna(QnaVO q) {
        this.qnaDAO.insertQna(q);
    }
    @Override //문의글 - 업체 검색 리스트
    public List<String> getPartners() {
        return this.qnaDAO.getPartners();
    }





}

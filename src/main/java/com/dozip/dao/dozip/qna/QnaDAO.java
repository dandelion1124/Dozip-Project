package com.dozip.dao.dozip.qna;

import com.dozip.vo.QnaVO;

import java.util.List;

public interface QnaDAO {
    int getListCount(String id); //문의글(관리자) 개수확인
    int getPListCount(String id); //문의글(업체) 개수확인
    List<QnaVO> getPlist(QnaVO q); //문의글(업체) 리스트
    List<QnaVO> getQlist(QnaVO q); //문의글(관리자) 리스트
    String getBnum(String businessName); //businessNum 확인
    void insertQna(QnaVO q); //문의글 등록
    List<String> getPartners(); //문의글 - 업체 검색 리스트
    QnaVO getQna(int qna_no); //문의글 내용확인
    List<QnaVO> getAllList(QnaVO q); //문의글(전체) 리스트
    List<QnaVO> adminQnaList(QnaVO q); //관리자페이지 - 문의글 전체 리스트
    int adminQnaCount(); //관리자페이지 - 문의글 개수
}

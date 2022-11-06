package com.dozip.dao.dozip.qna;

import com.dozip.vo.QnaVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class QnaDAOImpl implements QnaDAO{
    @Autowired
    private SqlSession sqlSession;

    @Override //문의글(관리자) 개수확인
    public int getListCount(String id) {
        return this.sqlSession.selectOne("listQ_count", id);
    }
    @Override //문의글(업체) 개수확인
    public int getPListCount(String id) {
        return this.sqlSession.selectOne("listP_count", id);
    }
    @Override //문의글(업체) 리스트
    public List<QnaVO> getPlist(QnaVO q) {
        return this.sqlSession.selectList("get_Plist", q);
    }
    @Override //문의글(관리자) 리스트
    public List<QnaVO> getQlist(QnaVO q) {
        return this.sqlSession.selectList("get_Qlist", q);
    }
    @Override //businessNum 확인
    public String getBnum(String businessName) {
        return this.sqlSession.selectOne("get_Bnum", businessName);
    }
    @Override //문의글 등록
    public void insertQna(QnaVO q) {
        this.sqlSession.insert("in_Qna", q);
    }
    @Override //문의글 - 업체 검색 리스트
    public List<String> getPartners() {
        return this.sqlSession.selectList("get_P");
    }
    @Override //문의글 내용확인
    public QnaVO getQna(int qna_no) {
        return this.sqlSession.selectOne("get_qna", qna_no);
    }


}

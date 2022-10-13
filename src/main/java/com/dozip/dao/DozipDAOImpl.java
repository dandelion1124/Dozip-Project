package com.dozip.dao;

import com.dozip.vo.MemberVO;
import com.dozip.vo.QnaVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DozipDAOImpl implements DozipDAO{

    @Autowired
    private SqlSession sqlSession;

    @Override
    public String loginCheck(String mem_id) {
        return this.sqlSession.selectOne("mlogin_check", mem_id);
    }

    @Override
    public String getFindID(MemberVO vo) {
        return this.sqlSession.selectOne("find_mid", vo);
    }

    @Override
    public MemberVO getMemberInfo(String id) { return this.sqlSession.selectOne("m_info", id); }

    @Override
    public int updateMember(MemberVO m) { return this.sqlSession.update("m_update", m); }

    @Override
    public int getListCount(String id) { return this.sqlSession.selectOne("listQ_count", id); }

    @Override
    public List<QnaVO> getQlist(QnaVO q) { return this.sqlSession.selectList("get_Qlist", q); }

    @Override
    public int getPListCount(String id) { return this.sqlSession.selectOne("listP_count", id); }

    @Override
    public List<QnaVO> getPlist(QnaVO q) { return this.sqlSession.selectList("get_Plist", q); }

    @Override
    public void insertQna(QnaVO q) { this.sqlSession.insert("in_Qna", q); }

    @Override
    public String getBnum(String businessName) { return this.sqlSession.selectOne("get_Bnum", businessName); }

    @Override
    public List<String> getPartners() { return this.sqlSession.selectList("get_P"); }

    @Override
    public int insertMem(MemberVO m) { return this.sqlSession.insert("in_m", m); }

    @Override
    public int checkID(String id) { return this.sqlSession.selectOne("check_id", id); }

    @Override
    public int updatePwd(MemberVO m) { return this.sqlSession.update("change_pwd", m); }

}

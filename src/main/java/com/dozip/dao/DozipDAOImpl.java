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
        return this.sqlSession.selectOne("login_check", mem_id);
    }

    @Override
    public String getFindID(MemberVO vo) {
        return this.sqlSession.selectOne("find_id", vo);
    }

    @Override
    public MemberVO getMemberInfo(String id) { return this.sqlSession.selectOne("m_info", id); }

    @Override
    public int updateMember(MemberVO m) { return this.sqlSession.update("m_update", m); }

    @Override
    public int getListCount(String id) { return this.sqlSession.selectOne("list_count", id); }

    @Override
    public List<QnaVO> getQlist(QnaVO q) { return this.sqlSession.selectList("get_Qlist", q); }

    @Override
    public int getPListCount(String id) { return this.sqlSession.selectOne("listP_count", id); }

    @Override
    public List<QnaVO> getPlist(QnaVO q) { return this.sqlSession.selectList("get_Plist", q); }
}

package com.dozip.dao.dozip.member;

import com.dozip.vo.MemberVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override //회원가입 완료
    public int insertMem(MemberVO m) {
        return this.sqlSession.insert("in_m", m);
    }
    @Override //아이디 중복체크
    public int checkID(String id) {
        return this.sqlSession.selectOne("check_id", id);
    }
    @Override //아이디 찾기
    public String getFindID(MemberVO vo) {
        return this.sqlSession.selectOne("find_mid", vo);
    }
    @Override //비번찾기-회원정보일치확인
    public int checkInfo(MemberVO m) {
        return this.sqlSession.selectOne("check_m", m);
    }
    @Override //비밀번호 변경
    public int updatePwd(MemberVO m) {
        return this.sqlSession.update("change_pwd", m);
    }
    @Override //회원정보 가져오기
    public MemberVO getMemberInfo(String id) {
        return this.sqlSession.selectOne("m_info", id);
    }
    @Override //회원정보수정
    public int updateMember(MemberVO m) {
        return this.sqlSession.update("m_update", m);
    }
    @Override //아이디에 해당하는 비밀번호
    public String loginCheck(String mem_id) {
        return this.sqlSession.selectOne("mlogin_check", mem_id);
    }
    @Override //로그인-회원체크
    public MemberVO login(String mem_id) {
        return this.sqlSession.selectOne("loginid", mem_id);
    }
}

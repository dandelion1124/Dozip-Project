package com.dozip.service.dozip.member;

import com.dozip.vo.MemberVO;
import com.dozip.vo.PartnersVO;
import com.dozip.vo.QnaVO;

import java.util.HashMap;
import java.util.List;

public interface MemberService {
    int insertMem(MemberVO m); //회원가입 완료
    int checkID(String id); //아이디중복체크
    String getFindID(MemberVO vo); //아이디 찾기
    int checkInfo(MemberVO m); //비번찾기-회원정보일치확인
    HashMap findPwd(MemberVO m, String imsiPwd); //비번찾기
    MemberVO getMemberInfo(String id); //회원정보 가져오기
    int updateMember(MemberVO m); //회원정보수정
    String loginCheck(String mem_id); //아이디에 해당하는 비밀번호
    int updatePwd(MemberVO m); //비밀번호 변경
    MemberVO login(String mem_id);//로그인-회원체크


}

package com.dozip.dao.admin;

import com.dozip.vo.MemberVO;
import com.dozip.vo.PartnersVO;

import java.util.List;

public interface AdminMemDAO {
    List<MemberVO> getMemList(); //회원 전체 리스트

    void delMem(String mem_id); //회원 삭제

    List<PartnersVO> getPartList();//파트너스 전체 리스트
}

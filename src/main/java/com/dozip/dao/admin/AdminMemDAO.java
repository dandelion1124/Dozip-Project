package com.dozip.dao.admin;

import com.dozip.vo.MemberVO;

import java.util.List;

public interface AdminMemDAO {
    List<MemberVO> getMemList(); //회원 전체 리스트
}

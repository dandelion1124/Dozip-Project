package com.dozip.service;

import com.dozip.vo.MemberVO;
import com.dozip.vo.QnaVO;

import java.util.List;

public interface DozipService {
    String loginCheck(String mem_id);

    String getFindID(MemberVO vo);

    MemberVO getMemberInfo(String id);

    int updateMember(MemberVO m);

    int getListCount(String id);

    List<QnaVO> getQlist(QnaVO q);

    int getPListCount(String id);

    List<QnaVO> getPlist(QnaVO q);
}

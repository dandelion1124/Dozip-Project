package com.dozip.dao;

import com.dozip.vo.MemberVO;
import com.dozip.vo.QnaVO;

import java.util.List;

public interface DozipDAO {
    String loginCheck(String mem_id);

    String getFindID(MemberVO vo);

    MemberVO getMemberInfo(String id);

    int updateMember(MemberVO m);

    int getListCount(String id);

    List<QnaVO> getQlist(QnaVO q);

    int getPListCount(String id);

    List<QnaVO> getPlist(QnaVO q);

    void insertQna(QnaVO q);

    String getBnum(String businessName);

    List<String> getPartners();
}

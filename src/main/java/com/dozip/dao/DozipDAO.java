package com.dozip.dao;

import com.dozip.vo.MemberVO;
import com.dozip.vo.PartnersVO;
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

    int insertMem(MemberVO m);

    int checkID(String id);

    int updatePwd(MemberVO m);

    int checkInfo(MemberVO m);

    List<PartnersVO> search_part(String p_address);

    int count_partners(String p_address);

    MemberVO login(String mem_id);
}

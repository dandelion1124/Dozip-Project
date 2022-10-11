package com.dozip.service;

import com.dozip.dao.DozipDAO;
import com.dozip.vo.MemberVO;
import com.dozip.vo.QnaVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DozipServiceImpl implements DozipService{

    @Autowired
    private DozipDAO dozipDAO;

    @Override
    public String loginCheck(String mem_id) {
        return this.dozipDAO.loginCheck(mem_id);
    }

    @Override
    public String getFindID(MemberVO vo) {
        return this.dozipDAO.getFindID(vo);
    }

    @Override
    public MemberVO getMemberInfo(String id) { return this.dozipDAO.getMemberInfo(id); }

    @Override
    public int updateMember(MemberVO m) { return this.dozipDAO.updateMember(m); }

    @Override
    public int getListCount(String id) { return this.dozipDAO.getListCount(id); }

    @Override
    public List<QnaVO> getQlist(QnaVO q) { return this.dozipDAO.getQlist(q); }

    @Override
    public int getPListCount(String id) { return this.dozipDAO.getPListCount(id); }

    @Override
    public List<QnaVO> getPlist(QnaVO q) { return this.dozipDAO.getPlist(q); }
}

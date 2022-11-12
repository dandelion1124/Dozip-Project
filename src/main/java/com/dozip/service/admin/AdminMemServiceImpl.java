package com.dozip.service.admin;

import com.dozip.dao.admin.AdminMemDAO;
import com.dozip.vo.MemberVO;
import com.dozip.vo.PartnersVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminMemServiceImpl implements AdminMemService {

    @Autowired
    private AdminMemDAO adminMemDAO;

    @Override //회원 전체 리스트
    public List<MemberVO> getMemList() {return this.adminMemDAO.getMemList();}

    @Override //회원 삭제
    public void delMem(String mem_id) {this.adminMemDAO.delMem(mem_id);}

    @Override
    public List<PartnersVO> getPartList() {return this.adminMemDAO.getPartList();}
}

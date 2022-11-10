package com.dozip.service.admin;

import com.dozip.dao.admin.AdminMemDAO;
import com.dozip.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminMemServiceImpl implements AdminMemService {

    @Autowired
    private AdminMemDAO adminMemDAO;

    @Override //회원 전체 리스트
    public List<MemberVO> getMemList() {return this.adminMemDAO.getMemList();}
}

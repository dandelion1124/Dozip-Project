package com.dozip.service.partners.myInterior;

import com.dozip.dao.partners.myInterior.MyInteriorDAO;
import com.dozip.vo.ContractVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MyInteriorServiceImpl implements MyInteriorService {
    @Autowired
    MyInteriorDAO myInteriorDAO;

    @Override
    public List<ContractVO> getContract_interior(ContractVO vo) {return myInteriorDAO.getContract_interior(vo);}
    @Override
    public ContractVO show_contract(String cont_no) {
        return myInteriorDAO.show_contract(cont_no);
    }

    @Override //달력에 등록할 공사일정 불러오기
    public List<ContractVO> getschedule(String businessNum) {
        return myInteriorDAO.getschedule(businessNum);
    }

    @Override
    public int regit_schedule(String cont_no) { //달력에 일정 등록
        return myInteriorDAO.regit_schedule(cont_no);
    }
}

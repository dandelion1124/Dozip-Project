package com.dozip.dao.admin;

import com.dozip.vo.MemberVO;
import com.dozip.vo.PartnersVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AdminMemDAOImpl implements AdminMemDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<MemberVO> getMemList() {return this.sqlSession.selectList("mem_list");}

    @Override
    public void delMem(String mem_id) {this.sqlSession.delete("del_m",mem_id);}

    @Override
    public List<PartnersVO> getPartList() {return this.sqlSession.selectList("part_list");}
}

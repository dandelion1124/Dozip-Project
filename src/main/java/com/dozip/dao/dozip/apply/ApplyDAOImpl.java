package com.dozip.dao.dozip.apply;

import com.dozip.vo.EstimateVO;
import com.dozip.vo.PartnersVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ApplyDAOImpl implements ApplyDAO{
    @Autowired
    private SqlSession sqlSession;

    @Override //누적견적신청수
    public int counter() {
        return this.sqlSession.selectOne("cCounter");
    }
    @Override //근처의 파트너스 불러오기
    public List<PartnersVO> search_part(String p_address) {
        return sqlSession.selectList("search_p",p_address);
    }
    @Override //근처에 있는 파트너스 숫자
    public int count_partners(String p_address) {
        return sqlSession.selectOne("counter_partners",p_address);
    }
    @Override //견적서 등록
    public void applyOk(EstimateVO e) {
        this.sqlSession.insert("a_insert", e);
    }
}

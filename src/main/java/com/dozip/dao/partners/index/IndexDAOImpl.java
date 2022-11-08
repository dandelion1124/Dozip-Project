package com.dozip.dao.partners.index;

import com.dozip.vo.PayVO;
import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class IndexDAOImpl implements  IndexDAO{
    @Autowired
    private SqlSession sqlSession;

    @Override//이번달 매출내역
    public PayVO montly_sales(String businessNum) {
        return sqlSession.selectOne("montly_sales", businessNum);
    }

    @Override
    public int portfolioCount(String bNum) {
        return sqlSession.selectOne("portfolioCount",bNum);
    }
}

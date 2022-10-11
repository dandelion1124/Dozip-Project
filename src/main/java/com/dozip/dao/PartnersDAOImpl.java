package com.dozip.dao;

import com.dozip.vo.PartnersVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PartnersDAOImpl implements PartnersDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public PartnersVO getPartnersInfo(String pId) {
        return sqlSession.selectOne("partners_info",pId);
    }
}

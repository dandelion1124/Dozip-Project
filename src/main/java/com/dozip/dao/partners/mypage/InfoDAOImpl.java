package com.dozip.dao.partners.mypage;

import com.dozip.vo.PartnersVO;
import com.dozip.vo.Partners_subVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InfoDAOImpl implements InfoDAO {
    @Autowired
    SqlSession sqlSession;

    @Override
    public PartnersVO getMember(String businessNum) {
        return sqlSession.selectOne("select_data",businessNum);
    }
    @Override
    public Partners_subVO getPartnersSub(String businessNum) { return sqlSession.selectOne("select_subdata",businessNum); }
    @Override
    public void updatePartners(PartnersVO p) { sqlSession.update("update_data",p); }

    @Override
    public void insertPartnersSub(Partners_subVO ps) { sqlSession.insert("insert_subdata",ps); }
    @Override
    public void updatePartnersSub(Partners_subVO ps) {
        sqlSession.update("update_subdata",ps);
    }

    @Override
    public int checkSub(String businessNum) {
        return sqlSession.selectOne("res_check",businessNum);
    }
}
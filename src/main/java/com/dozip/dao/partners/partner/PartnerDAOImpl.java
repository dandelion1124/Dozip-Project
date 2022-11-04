package com.dozip.dao.partners.partner;

import com.dozip.vo.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PartnerDAOImpl implements PartnerDAO {
    @Autowired
    private SqlSession sqlSession;
    @Override
    public PartnersVO getPartnersInfo(String pId) {
        return sqlSession.selectOne("partners_info", pId);
    }//파트너스 정보조회
    @Override
    public void insertPartners(PartnersVO pv) {
        sqlSession.insert("partners_in",pv);
    }//파트너스 회원가입
    @Override
    public PartnersVO getPartnersInfo2(String findid_business_num) {
        return sqlSession.selectOne("findinfo_id",findid_business_num);
    }//사업자 번호 기준 정보 조회
    @Override
    public int checkBusinessNum(PartnersVO pv) {
        return sqlSession.selectOne("check_bnum",pv);
    }
    @Override
    public List<BidVO> getBidList() {
        return sqlSession.selectList("est_list2");
    }

    @Override
    public List<ContractVO> getContractList_port(String businessNum) {
        return sqlSession.selectList("portfolio_load", businessNum);
    }
    @Override
    public List<EstimateVO> getpartEstList(String businessNum) {
        return sqlSession.selectList("partners_esimate",businessNum);
    }
}



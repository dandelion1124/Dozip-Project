package com.dozip.dao.partners.customer;

import com.dozip.vo.QnaVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CustomerDAOImpl implements CustomerDAO {
    @Autowired
    SqlSession sqlSession;

    @Override
    public int getListCount(QnaVO findQ) {
        return sqlSession.selectOne("qna_count",findQ);
    }
    @Override
    public List<QnaVO> getQnaList(QnaVO findQ) {
        return sqlSession.selectList("partners_qna_list", findQ);
    }

    @Override
    public int insertQna(QnaVO qdto) {
        return sqlSession.insert("partners_reply_in", qdto);
    }
    @Override
    public void updateState(QnaVO qdto) {
        sqlSession.update("change_state",qdto);
    }
    @Override
    public void updateLevel(QnaVO qdto) {
        sqlSession.update("reply_levelUp",qdto);
    }
    @Override
    public int deleteReply(QnaVO dv) {
        return sqlSession.delete("del_reply",dv);
    }
    @Override
    public int selqnaRef(QnaVO dv) {
        return sqlSession.selectOne("sel_qnaRef", dv);
    }
    @Override
    public void returnState(QnaVO dv) {
        sqlSession.update("returnState", dv);
    }
}

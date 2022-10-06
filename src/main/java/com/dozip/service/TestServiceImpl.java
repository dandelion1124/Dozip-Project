package com.dozip.service;

import com.dozip.dao.TestDAO;
import com.dozip.vo.TestVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class TestServiceImpl implements TestService {

    @Autowired
    private TestDAO testDao;


    @Override
    public void insertDb(TestVO vo) {
        testDao.insertDb(vo);
    }
}

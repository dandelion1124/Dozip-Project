package com.dozip.service;

import com.dozip.dao.ServiceDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    private ServiceDAO serviceDAO;
}

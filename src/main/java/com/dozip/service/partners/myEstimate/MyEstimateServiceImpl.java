package com.dozip.service.partners.myEstimate;

import com.dozip.dao.partners.myEstimate.MyEstimateDAO;
import com.dozip.vo.BidVO;
import com.dozip.vo.ContractVO;
import com.dozip.vo.EstimateVO;
import com.dozip.vo.PayVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class MyEstimateServiceImpl implements MyEstimateService{
    @Autowired
    MyEstimateDAO myEstimateDAO;

    @Override
    public List<EstimateVO> getAllEstList(String businessNum) {return myEstimateDAO.getAllEstList(businessNum);}
    @Override
    public List<ContractVO> getContractList(String businessNum) {
        return myEstimateDAO.getContractList(businessNum);
    }
    @Override
    public List<PayVO> getpayList(String businessNum) {
        return myEstimateDAO.getpayList(businessNum);
    }
    @Override
    public BidVO getOneBid(String est_num) {return myEstimateDAO.getOneBid(est_num);}
    @Override
    public EstimateVO getOneEst(String est_num) {
        return myEstimateDAO.getOneEst(est_num);
    }
    @Override
    public EstimateVO write_contract(String est_num){
        return myEstimateDAO.write_contract(est_num);
    }

    @Transactional
    @Override
    public int insertContract(ContractVO cv) {
        myEstimateDAO.updateEstimate(cv);
        return myEstimateDAO.insertContract(cv);
    }


}

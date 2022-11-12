package com.dozip.service.partners.partner;

import com.dozip.dao.partners.partner.PartnerDAO;
import com.dozip.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PartnerServiceImpl implements PartnerService {
    @Autowired
    private PartnerDAO partnerDao;

    @Override
    public PartnersVO getPartnersInfo(String pId) {
        return partnerDao.getPartnersInfo(pId);
    }


    @Override
    public void insertPartners(PartnersVO pv) {
        partnerDao.insertPartners(pv);
    }
    @Override
    public PartnersVO getPartnersInfo2(String findid_business_num) {
        return partnerDao.getPartnersInfo2(findid_business_num);
    }

    @Override
    public void updatePwd(PartnersVO vo) {
        partnerDao.updatePwd(vo);
    }

    @Override
    public int checkBusinessNum(PartnersVO pv) {
        return partnerDao.checkBusinessNum(pv);
    }


    /* minwoo */
    /* My page */



    /* bid */



    /* construct_request */






    @Override
    public List<BidVO> getBidList() {
        return partnerDao.getBidList();
    }









    @Override
    public List<ContractVO> getContractList_port(String businessNum) {
        return partnerDao.getContractList_port(businessNum);
    }

    @Override
    public List<EstimateVO> getpartEstList(String businessNum) {
        return partnerDao.getpartEstList(businessNum);
    }






}


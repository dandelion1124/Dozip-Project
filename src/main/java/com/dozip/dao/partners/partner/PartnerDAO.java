package com.dozip.dao.partners.partner;

import com.dozip.vo.*;

import java.util.List;

public interface PartnerDAO {
    PartnersVO getPartnersInfo(String pId);
    void insertPartners(PartnersVO pv);
    PartnersVO getPartnersInfo2(String findid_business_num);


    int checkBusinessNum(PartnersVO pv);

    /* minwoo */
    /* My page */


    /* bid */
    /*bid_detail */

    /* my_bid */

    /* construct_request */




    List<BidVO> getBidList();



    List<ContractVO> getContractList_port(String businessNum);
    List<EstimateVO> getpartEstList(String businessNum);


    void updatePwd(PartnersVO vo);
}


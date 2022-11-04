package com.dozip.service.partners.partner;


import com.dozip.vo.*;

import java.util.List;

public interface PartnerService {
    PartnersVO getPartnersInfo(String pId);
    void insertPartners(PartnersVO pv);
    PartnersVO getPartnersInfo2(String findid_business_num);

    int checkBusinessNum(PartnersVO pv);

    /*minwoo*/
    /* My page */


    /* bid */

    /* construct_request */
    //List<EstimateVO> selectEstimateListBnum(EstimateVO e);



    List<BidVO> getBidList();








    List<ContractVO> getContractList_port(String businessNum);

    List<EstimateVO> getpartEstList(String businessNum);

    //interior_list 에서 사용
    //interior_list 에서 사용
    //esimate_list 에서 사용
}

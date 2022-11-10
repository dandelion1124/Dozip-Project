package com.dozip.service.partners.partner;


import com.dozip.vo.*;

import java.util.List;

public interface PartnerService {
    PartnersVO getPartnersInfo(String pId);
    void insertPartners(PartnersVO pv);
    PartnersVO getPartnersInfo2(String findid_business_num);

    int checkBusinessNum(PartnersVO pv);

    /*minwoo*/
    List<BidVO> getBidList();

    List<ContractVO> getContractList_port(String businessNum);

    List<EstimateVO> getpartEstList(String businessNum);

    void updatePwd(PartnersVO vo); //비번변경시 암호화해서 저장
}

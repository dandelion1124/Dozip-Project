package com.dozip.dao.partners.mypage;

import com.dozip.vo.PartnersVO;
import com.dozip.vo.Partners_subVO;

public interface InfoDAO {
    PartnersVO getMember(String businessNum); //data_manage 회원정보
    Partners_subVO getPartnersSub(String businessNum);
    void updatePartners(PartnersVO p);
    void insertPartnersSub(Partners_subVO ps);
    void updatePartnersSub(Partners_subVO ps);
    int checkSub(String businessNum);

    String ploginCheck(String p_id);

    int pupdatePwd(PartnersVO p);
}

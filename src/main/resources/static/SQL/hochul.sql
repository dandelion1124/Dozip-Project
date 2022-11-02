select c.*, p.PAY_STATE from CONTRACTT c, PAYT p where p.CONT_NO=c.CONT_NO



select c.*, p.PAY_STATE from CONTRACTT c, PAYT p where c.BUSINESSNUM='111-11-11111' and p.CONT_NO=c.CONT_NO and PAY_STATE!='계약금요청';

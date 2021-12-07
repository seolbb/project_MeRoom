package com.spring.mr.service.oneday;

import com.spring.mr.vo.oneday.OPaymentVO;

public interface OPaymentService {
	int insertPayment(OPaymentVO vo);
	int getOpoint(String orIdx);
	int getOpMoney(String orIdx);
	
}

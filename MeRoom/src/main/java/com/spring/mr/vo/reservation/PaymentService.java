package com.spring.mr.vo.reservation;

import java.util.List;

public interface PaymentService {

	//결제
	int insertPay(PaymentVO vo);

	List<PaymentVO> pamentList();

	int getPoint(String getrIdx);
}

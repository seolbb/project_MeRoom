package com.spring.mr.service.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mr.vo.reservation.PaymentService;
import com.spring.mr.vo.reservation.PaymentVO;

@Service("paymentservice")
public class PaymentServiceImpl implements PaymentService{
	
	@Autowired
	PaymentDAOMybatis paymentDAO;
	
	@Override
	public int insertPay(PaymentVO vo) {
		
		return paymentDAO.insertPay(vo);
	}

	@Override
	public List<PaymentVO> pamentList() {
		
		return paymentDAO.pamentList();
	}

	@Override
	public int getPoint(String getrIdx) {
		
		return paymentDAO.getPoint(getrIdx);
	}
	


}

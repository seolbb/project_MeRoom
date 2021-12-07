package com.spring.mr.service.reservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mr.vo.reservation.RefundService;
import com.spring.mr.vo.reservation.RefundVO;

@Service("refundService")
public class RefundServiceImpl implements RefundService{
	
	@Autowired
	RefundDAOMybatis refundDAO;
	
	@Override
	public int insertRefund(RefundVO vo) {
		
		return refundDAO.insertRefund(vo);
	}

}

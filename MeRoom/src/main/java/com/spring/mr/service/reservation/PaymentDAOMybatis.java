package com.spring.mr.service.reservation;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mr.vo.reservation.PaymentVO;

@Repository
public class PaymentDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insertPay(PaymentVO vo){
		
		System.out.println("mybatis실행");
		return mybatis.insert("paymentDAO.paymentInsert",vo);
	}

	public List<PaymentVO> pamentList() {
		
		return mybatis.selectList("paymentDAO.paymentList");
	}

	public int getPoint(String getrIdx) {
		
		return mybatis.selectOne("paymentDAO.getPoint",getrIdx);
	}
	
}

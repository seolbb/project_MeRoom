package com.spring.mr.service.reservation;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mr.vo.reservation.RefundVO;
@Repository
public class RefundDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insertRefund(RefundVO vo) {
		
		System.out.println("mybatis실행");
		return mybatis.insert("refundDAO.refundInsert",vo);
	}
}

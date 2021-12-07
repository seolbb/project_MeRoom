package com.spring.mr.service.oneday;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mr.vo.oneday.OPaymentVO;

@Repository
public class OPaymentDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public OPaymentDAO() {
		System.out.println(">> OPaymentDAO() 객체 생성");
	}
	
	// 예약
	public int insertPayment(OPaymentVO vo) {
		System.out.println("===> MyBatis로 insertPayment() 실행");
		return mybatis.insert("oPaymentDAO.insertPayment", vo);
	}
	
	public int getOpoint(String orIdx) {
		System.out.println("===> MyBatis로 getOpoint() 실행");
		return mybatis.selectOne("oPaymentDAO.getOpoint", orIdx);	
	}
	
	public int getOpMoney(String orIdx) {
		System.out.println("===> MyBatis로 getOpMoney() 실행");
		return mybatis.selectOne("oPaymentDAO.getOpMoney", orIdx);	
	}

}

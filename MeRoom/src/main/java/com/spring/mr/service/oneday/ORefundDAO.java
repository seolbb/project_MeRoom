package com.spring.mr.service.oneday;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mr.vo.oneday.ORefundVO;

@Repository
public class ORefundDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public ORefundDAO() {
		System.out.println(">> ORefundDAO() 객체 생성");
	}
	
	// 예약
	public int insertRefund(ORefundVO vo) {
		System.out.println("===> MyBatis로 insertRefund() 실행");
		return mybatis.insert("oRefundDAO.insertRefund", vo);
	}

}

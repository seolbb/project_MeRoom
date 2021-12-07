package com.spring.mr.service.oneday;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mr.vo.oneday.OPaymentVO;

@Service("oPaymentService")
public class OPaymentServiceImpl implements OPaymentService {
	@Autowired
	private OPaymentDAO opaymentDAO;

	@Override
	public int insertPayment(OPaymentVO vo) {
		return opaymentDAO.insertPayment(vo);
	}

	@Override
	public int getOpoint(String orIdx) {
		return opaymentDAO.getOpoint(orIdx);
	}

	@Override
	public int getOpMoney(String orIdx) {
		return opaymentDAO.getOpMoney(orIdx);
	}


}

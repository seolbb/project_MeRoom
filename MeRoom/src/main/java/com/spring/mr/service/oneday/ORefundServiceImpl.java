package com.spring.mr.service.oneday;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mr.vo.oneday.ORefundVO;

@Service("oRefundService")
public class ORefundServiceImpl implements ORefundService {
	@Autowired
	private ORefundDAO orefundDAO;

	@Override
	public int insertRefund(ORefundVO vo) {
		return orefundDAO.insertRefund(vo);
	}

}

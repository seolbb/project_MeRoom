package com.spring.mr.service.enjoy;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mr.vo.enjoy.EnjoyVO;
import com.spring.mr.vo.place.PlaceVO;

@Service("enjoyService") // @Component 상속확장 어노테이션, 비즈니스 로직 처리 서비스 영역에 사용 
public class EnjoyServiceImpl implements EnjoyService {

	@Autowired // 타입이 일치하는 객체(인스턴스)에 주입한다.
	private EnjoyDAO EnjoyDAO;


	@Override
	public void insertEnjoy(EnjoyVO vo) {
		EnjoyDAO.insertEnjoy(vo);
	}

	@Override
	public void updateEnjoy(EnjoyVO vo) {
		EnjoyDAO.updatetEnjoy(vo);
	}

	@Override
	public void deleteEnjoy(EnjoyVO vo) {
		EnjoyDAO.deleteEnjoy(vo);
	}

	@Override
	public EnjoyVO getEnjoy(EnjoyVO vo) {
		return EnjoyDAO.getEnjoy(vo);
	}
	
	
	
	@Override
	public List<EnjoyVO> getEnjoyList() {
		return EnjoyDAO.getEnjoyList();
	}

	@Override
	public List<EnjoyVO> getEnjoyList(EnjoyVO vo) {
		return EnjoyDAO.getEnjoyList(vo);
	}

	@Override
	public List<EnjoyVO> getFoodsList() {
		return EnjoyDAO.getFoodsList();
	}

	@Override
	public List<EnjoyVO> getEntertainsList() {
		return EnjoyDAO.getEntertainsList();
	}

	

	
}

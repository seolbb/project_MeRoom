package com.spring.mr.service.cs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mr.service.cs.FAService;
import com.spring.mr.service.cs.NewsService;
import com.spring.mr.vo.cs.FAVO;
import com.spring.mr.vo.cs.NewsVO;


// @Service : @Component 상속확장 어노테이션
// 		비즈니스 로직 처리 서비스 영역에 사용
@Service("FAService")
public class FAServiceImpl implements FAService {
	
	@Autowired // 타입이 일치하는 객체(인스턴스) 주입
	
	private FADAO faDAO;
	
	
	public FAServiceImpl() {
		System.out.println("FAServiceImpl() 객체 생성");
	}


	@Override
	public void insertFA(FAVO vo) {
		faDAO.insertFA(vo);
		
	}


	@Override
	public void updateFA(FAVO vo) {
		faDAO.updateFA(vo);
		
	}


	@Override
	public void deleteFA(FAVO vo) {
		faDAO.deleteFA(vo);
		
	}


	@Override
	public FAVO getFA(FAVO vo) {
		return faDAO.getFA(vo);
	}


	@Override
	public List<FAVO> getFAList() {
	
		return faDAO.getFAList();
	}



	

}

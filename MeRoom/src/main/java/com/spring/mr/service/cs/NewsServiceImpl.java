package com.spring.mr.service.cs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mr.vo.cs.NewsVO;


// @Service : @Component 상속확장 어노테이션
// 		비즈니스 로직 처리 서비스 영역에 사용
@Service("newsService")
public class NewsServiceImpl implements NewsService {
	
	@Autowired // 타입이 일치하는 객체(인스턴스) 주입
	
	private NewsDAO newsDAO;
	
	
	public NewsServiceImpl() {
		System.out.println("NewsServiceImpl() 객체 생성");
	}

	
	@Override
	public void insertNews(NewsVO vo) {
		newsDAO.insertNews(vo);
		
	}

	@Override
	public void updateNews(NewsVO vo) {
		newsDAO.updateNews(vo);
		
	}

	@Override
	public void deleteNews(NewsVO vo) {
		newsDAO.deleteNews(vo);
		
	}

	@Override
	public NewsVO getNews(NewsVO vo) {
		return newsDAO.getNews(vo);
	}

	@Override
	public List<NewsVO> getNewsList() {
		return newsDAO.getNewsList();
	}

	@Override
	public List<NewsVO> getNewsList(NewsVO vo) {
		return newsDAO.getNewsList(vo);
	}

}

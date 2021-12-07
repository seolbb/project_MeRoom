package com.spring.mr.service.cs;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mr.vo.cs.NewsVO;



@Repository
public class NewsDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public NewsDAO() {
		System.out.println(">> NewsDAOMybatis() 객체 생성");
	}

	// 글입력
	public void insertNews(NewsVO vo) {
		System.out.println("===> MyBatis로 insertNews() 실행");
		mybatis.insert("newsDAO.insertNews", vo);
	}

	// 글수정
	public void updateNews(NewsVO vo) {
		System.out.println("===> MyBatis로 updateNews() 실행");
		mybatis.update("newsDAO.updateNews", vo);
	}

	// 글삭제
	public void deleteNews(NewsVO vo) {
		System.out.println("===> MyBatis로 deleteNews() 실행");
		mybatis.delete("newsDAO.deleteNews", vo);
	}

	// 글 하나조회
	public NewsVO getNews(NewsVO vo) {
		System.out.println("===> MyBatis로 getNews() 실행");
		return mybatis.selectOne("newsDAO.getNews", vo);
	}

	// 글 목록 조회
	public List<NewsVO> getNewsList() {
		System.out.println("===> MyBatis로 getNewsList() 실행");
		return null;
	}

	public List<NewsVO> getNewsList(NewsVO vo) {
		System.out.println("===> MyBatis로 getNewsList(vo) 실행");
		return mybatis.selectList("newsDAO.getNewsList", vo);
	}
}
